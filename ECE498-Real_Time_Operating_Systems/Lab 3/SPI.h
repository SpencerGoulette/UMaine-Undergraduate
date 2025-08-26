#ifndef __STM32L476G_DISCOVERY_SPI_H
#define __STM32L476G_DISCOVERY_SPI_H

#include "stm32l476xx.h"

void L3GD20_Init(void);
void GYRO_IO_Write(uint8_t *pBuffer, uint8_t WriteAddr, uint8_t NumByteToWrite);
void GYRO_IO_Read(uint8_t *pBuffer, uint8_t ReadAddr, uint8_t NumByteToRead);
void SPI_Write(SPI_TypeDef * SPIx, uint8_t *txBuffer, uint8_t *rxBuffer, int size);
void SPI_Read(SPI_TypeDef *SPIx, uint8_t *rxBuffer, int size);
void SPI_Init(SPI_TypeDef * SPIx);

#endif /* __STM32L476G_DISCOVERY_SPI_H */
