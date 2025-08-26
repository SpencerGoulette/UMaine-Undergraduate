#include "Systick.h"
#include "LED.h"
#include <string.h>

volatile uint32_t TimeDelay;	// Systick's Time Delay

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