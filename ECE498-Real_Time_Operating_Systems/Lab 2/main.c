#include "stm32l476xx.h"
#include "SysClock.h"
#include "LED.h"
#include "UART.h"
#include "I2C.h"

#include <string.h>

void sysTick_Initialize(uint32_t ticks);	//Initializes SysTick
void delay(uint32_t nTime);		//Time to Delay
void SysTick_Handler(void);		//The interrupt to create the system delay

volatile uint32_t TimeDelay;	// Systick's Time Delay

uint8_t SlaveAddress;	// Address of TC74
uint8_t Data_Receive[6];	// Data Buffers
uint8_t Data_Send[6];
uint8_t buffer[2];

int main(void){
	
	System_Clock_Init(); // Switch System Clock = 80 MHz
	LED_Init();
	I2C_GPIO_init();	// Initializes GPIO Pins for I2C
	I2C_Initialization(I2C1);	// Initializes I2C
	sysTick_Initialize(1000);	//Initializes SysTick
	UART2_Init();	// Initializes UART2
	SlaveAddress = 0x48 << 1;	// Address of TC74

	while (1){
			Data_Send[0] = 0x00;	// A0 = 1001000 = 0x48
			I2C_SendData(I2C1, SlaveAddress, Data_Send, 1);
			I2C_Receivedata(I2C1, SlaveAddress, Data_Receive, 1);
			sprintf(buffer,"%d C                 %.1lf F\n\r",Data_Receive[0], ((double)Data_Receive[0])*1.8 + 32); // Converts value to string
			DMA_Init(buffer, 30);	// Initializes DMA to send sstring
			delay(10000);	// Delays 1 Sec
	}
}

void delay(uint32_t nTime)	//Delay the nTime passed in in milliseconds
{
	TimeDelay = nTime;		//By setting TimeDelay to nTime, the SysTick_Handler occurs
	while(TimeDelay != 0);
}

void SysTick_Handler(void)	//Interrupt to decrease the TimeDelay
{
	if(TimeDelay > 0)
	{
		TimeDelay--;
	}
}

void sysTick_Initialize(uint32_t ticks)	//Initializes SysTick
{
	SysTick->CTRL = 0;	//Disable SysTick IRQ and SysTick timer
	
	SysTick->LOAD = ticks - 1;	//Set Load Value
	
	
	
	NVIC_SetPriority (SysTick_IRQn, (1<<__NVIC_PRIO_BITS) - 1);		//Set Interrupt Priority
	
	
	SysTick->VAL = 0;		//Clear SysTick current value register
	
	
	
	SysTick->CTRL &= ~SysTick_CTRL_CLKSOURCE_Msk;	//Set CLKSOURCE to 0 to use the MSI AHB clock frequency/8
	
	
	SysTick->CTRL |= SysTick_CTRL_TICKINT_Msk;	//Enable Systick Interrupt
	
	
	SysTick->CTRL |= SysTick_CTRL_ENABLE_Msk;	//Set Systick Control and Status Register
}
