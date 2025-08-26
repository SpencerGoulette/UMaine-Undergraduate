//******************** (C) Yifeng ZHU ********************
// @file    main.c
// @author  Yifeng Zhu
// @version V1.0.0
// @date    November-11-2012
// @note    
// @brief   C code for STM32L1xx Discovery Kit
//		    System Tick, System Timer
//********************************************************

#include <stdint.h>
#include "stm32l476xx.h"
#include "SysClock.h"

/* STM32L1xx Discovery Kit:
    - USER Pushbutton: connected to PA0 (GPIO Port A, PIN 0), CLK RCC_AHBENR_GPIOAEN
    - RESET Pushbutton: connected RESET
    - GREEN LED: connected to PB6 (GPIO Port B, PIN 7), CLK RCC_AHBENR_GPIOBEN 
    - BLUE LED: connected to PB6 (GPIO Port B, PIN 6), CLK RCC_AHBENR_GPIOBEN
    - Linear touch sensor/touchkeys: PA6, PA7 (group 2),  PC4, PC5 (group 9),  PB0, PB1 (group 3)
*/
#define MAX_TASKS     				5
#define MAIN_RETURN   				0xFFFFFFF9  //Tells the handler to return using the MSP
#define THREAD_RETURN 				0xFFFFFFFD 	//Tells the handler to return using the PSP

#define TASK_FLAGS_INIT	 			(1<<2)     
#define TASK_FLAGS_EXEC 			(1<<6)


#define TASK_FLAGS_GET_PARENT(flags) ( flags >> 16 )
#define TASK_FLAGS_PARENT_MASK 0xFFFF0000

#define DEFAULT_PSP_STACK    0x20003000
#define EXTRA_STACK_SIZE     48              // size must be a multiple of 4


void SysTick_Init( void );
__asm void SysTick_Handler( void );

__asm uint32_t get_MSP( void );
__asm uint32_t get_PSP( void );
__asm void set_MSP( uint32_t );
__asm void set_PSP( uint32_t );

void tasks_init(void);
void new_task(void (*func)(void*), uint32_t args);
void del_process(void);

uint32_t get_next_task(void);
void     update_sp(void);

void my_task_1(void * data);
void my_task_2(void * data);


//This defines the stack frame
typedef struct {
	uint32_t r4;
	uint32_t r5;
	uint32_t r6;
	uint32_t r7;
	uint32_t r8;
	uint32_t r9;
	uint32_t r10;
	uint32_t r11;	
	uint32_t r0;
	uint32_t r1;
	uint32_t r2;
	uint32_t r3;
	uint32_t r12;
	uint32_t lr;
	uint32_t pc;
	uint32_t psr;
} stack_frame_t;


typedef struct {
	uint32_t  sp; 			// The task's current stack pointer
	int flags; 			// Status flags includes activity status, parent task, etc
} task_table_t;


volatile uint32_t counter_task1 = 0;
volatile uint32_t counter_task2 = 0;
volatile uint32_t counter_main  = 0;

int current_task = 0;
task_table_t task_table[MAX_TASKS];



//Reads the main stack pointer
__asm uint32_t  get_MSP(void){
		MRS r0, msp
		BX  lr
}
//Write the main stack pointer
__asm void set_MSP(uint32_t topStackPointer){
		MSR msp, r0
		BX  lr
}

//Reads the process stack pointer
__asm uint32_t  get_PSP(void){
		MRS r0, psp
		BX  lr
}

//Write the process stack pointer
__asm void set_PSP(uint32_t topStackPointer){
		MSR psp, r0
		BX  lr
}

void tasks_init(){
	int i;
	int stack_size;
	stack_size = sizeof(stack_frame_t)  + EXTRA_STACK_SIZE;
	
	task_table[0].sp = get_MSP();
	task_table[i].flags = 0;
	
	for(i=1; i < MAX_TASKS; i++){
		task_table[i].flags = 0;
		task_table[i].sp    = DEFAULT_PSP_STACK - i*stack_size;
	}
}

void new_task(void (*func)(void*), uint32_t args){
    int i;
    stack_frame_t * frame;
    for(i=1; i < MAX_TASKS; i++){
        if( task_table[i].flags == 0 ){
            frame = (stack_frame_t *)( task_table[i].sp - sizeof(stack_frame_t) );
						frame->r4 = 4;
						frame->r5 = 5;
						frame->r6 = 6;
						frame->r7 = 7;
						frame->r8 = 8;
						frame->r9 = 9;
						frame->r10 = 10;
						frame->r11 = 11;
            frame->r0 = (uint32_t)args;
            frame->r1 = 1;
            frame->r2 = 2;
            frame->r3 = 3;
            frame->r12 = 12;
            frame->pc = ((uint32_t)func);
            frame->lr = (uint32_t)del_process;
            frame->psr = 0x21000000; //default PSR value					
            task_table[i].flags = TASK_FLAGS_EXEC | TASK_FLAGS_INIT;
            task_table[i].sp =  (uint32_t) frame;		
						set_PSP(task_table[i].sp);
            break;
        }
    }
}

void update_sp(void) {
	 if (current_task == 0) {
		 	task_table[current_task].sp = get_MSP(); //Save the current task's stack pointer
	 } else if ( (task_table[current_task].flags & TASK_FLAGS_INIT) == 0 ) {
			task_table[current_task].sp = get_PSP(); //Save the current task's stack pointer
	 }
}

//This is the context switcher
uint32_t get_next_task(void) {
   while(1) {
		 current_task++;
     if ( current_task == MAX_TASKS ){
			current_task = 0;
			set_MSP( task_table[current_task].sp ); 
			return MAIN_RETURN; //Return to main process using main stack
		} else if ( task_table[current_task].flags & TASK_FLAGS_EXEC ){ //Check to see if this task should be skipped
			//change to unprivileged mode						
			set_PSP( task_table[current_task].sp ); 	//write the value of the PSP to the new task
			if (task_table[current_task].flags & TASK_FLAGS_INIT)
				task_table[current_task].flags &= ~TASK_FLAGS_INIT;  // clear the INIT flag
			return THREAD_RETURN; 						//Use the thread stack upon handler return
		}
	}  
}


//The SysTick interrupt handler -- this grabs the main stack value then calls the context switcher
__asm void SysTick_Handler(void){
			IMPORT get_next_task
		  IMPORT update_sp
	
			CPSID 	I							; Set PRIMASK to disable IRQ
	
			; save the context of current task
			; If LR = 0xFFFFFFF9, SP = MSP
			; If LR = 0xFFFFFFFD, SP = PSP			
			TST     lr, #0x04
			MRSEQ   r0, msp 
			MRSNE   r0, psp
			STMDB 	r0!,{r4-r11}
			MSREQ 	msp, r0
		  MSRNE  	psp, r0

			BL  	  update_sp; 
			BL 			get_next_task    ; r0 =  0xFFFFFFF9 or 0xFFFFFFFD
			MOV 		lr, r0           ; set the link register

			; load the context of new task
			TST     lr, #0x04
			MRSEQ   r0, msp 
			MRSNE   r0, psp
			LDMFD   r0!,{r4-r11}
			MSREQ 	msp, r0			
			MSRNE  	psp, r0
			
			CPSIE 	I						; Clear PRIMASK to enable IRQ
			
			BX  lr
}


//This does the same thing as the SysTick handler -- it is just triggered in a different way
void pendsv_handler(void){
//     save_context();  //The context is immediately saved
//     stack = get_PSP();
//     context_switcher();
//     load_context(); //Since the PSP has been updated, this loads the last state of the new task
}

//This is called when the task returns
void del_process(void){
  task_table[current_task].flags = 0; //clear the in use and exec flags
  SCB->ICSR |= (1<<28); //switch the context
  while(1); //once the context changes, the program will no longer return to this thread
}


void my_task_1(void *data){
	int i;
	while(1){
		counter_task1++;
		for(i = 0; i < 1000; i++); //delay
	}
}

void my_task_2(void * data){
	int j;
	while(1){
		counter_task2++;
		for(j = 0; j < 1000; j++); //delay
	}
}

int main(void){
	int k;
	
	uint32_t var = 1;
	
	System_Clock_Init(); // Switch System Clock = 80 MHz
	
	tasks_init();
	
// 	NVIC_SetPriority(SVCall_IRQn, 1);		// Set Priority to 1
// 	NVIC_EnableIRQ(SVCall_IRQn);			// Enable EXTI0_1 interrupt in NVIC
	
	new_task(my_task_1, (uint32_t)&var);
	new_task(my_task_2, (uint32_t)&var);	
	
	SysTick_Init();
	
	//NVIC_SetPriority(SysTick_IRQn, 1);		// Set Priority to 1
	NVIC_EnableIRQ(SysTick_IRQn);			// Enable EXTI0_1 interrupt in NVIC
	
	while(1){
		counter_main++;
		for(k = 0; k < 1000; k++); //delay
	}
}


//******************************************************************************************
// Initialize SysTick	
//******************************************************************************************	
//******************************************************************************************
// Initialize SysTick	
//******************************************************************************************	
void SysTick_Init(void){
	// The RCC feeds the Cortex System Timer (SysTick) external clock with the AHB clock
	// (HCLK) divided by 8. The SysTick can work either with this clock or with the Cortex clock
	// (HCLK), configurable in the SysTick Control and Status Register.
	
	//  SysTick Control and Status Register
	SysTick->CTRL = 0;										// Disable SysTick IRQ and SysTick Counter
	
	// SysTick Reload Value Register
	SysTick->LOAD = 80000000/1000 - 1;    // 1ms, Default clock
	
	// SysTick Current Value Register
	SysTick->VAL = 0;

	NVIC_SetPriority(SysTick_IRQn, 1);		// Set Priority to 1
	NVIC_EnableIRQ(SysTick_IRQn);					// Enable EXTI0_1 interrupt in NVIC

	// Enables SysTick exception request
	// 1 = counting down to zero asserts the SysTick exception request
	// 0 = counting down to zero does not assert the SysTick exception request
	SysTick->CTRL |= SysTick_CTRL_TICKINT_Msk;
	
	// Select processor clock
	// 1 = processor clock;  0 = external clock
	SysTick->CTRL |= SysTick_CTRL_CLKSOURCE_Msk;		
	
	// Enable SysTick IRQ and SysTick Timer
	SysTick->CTRL |= SysTick_CTRL_ENABLE_Msk;  
}




