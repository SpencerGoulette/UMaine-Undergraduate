#ifndef __STM32L476G_DISCOVERY_I2C_H
#define __STM32L476G_DISCOVERY_I2C_H

#include "stm32l476xx.h"

uint8_t I2C_Receivedata(I2C_TypeDef * I2Cx, uint8_t SlaveAddress, uint8_t *pData, uint8_t Size);
uint8_t I2C_SendData(I2C_TypeDef * I2Cx, uint8_t SlaveAddress, uint8_t *pData, uint8_t Size);
void I2C_WaitLineIdle(I2C_TypeDef * I2Cx);
void I2C_Stop(I2C_TypeDef * I2Cx);
void I2C_Start(I2C_TypeDef * I2Cx, uint32_t DevAddress, uint8_t Size, uint8_t Direction);
void I2C_Initialization(I2C_TypeDef * I2Cx);
void I2C_GPIO_init(void);

#endif /* __STM32L476G_DISCOVERY_I2C_H */
