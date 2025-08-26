#ifndef __STM32L476G_DISCOVERY_Systick_H
#define __STM32L476G_DISCOVERY_Systick_H

#include "stm32l476xx.h"

void sysTick_Initialize(uint32_t ticks);	//Initializes SysTick
void delay(uint32_t nTime);		//Time to Delay
void SysTick_Handler(void);		//The interrupt to create the system delay

#endif /* __STM32L476G_DISCOVERY_Systick_H */
