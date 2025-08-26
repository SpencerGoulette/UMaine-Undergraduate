#ifndef __STM32L476G_DISCOVERY_SPIInit_H
#define __STM32L476G_DISCOVERY_SPIInit_H

void SPI_Init(SPI_TypeDef * SPIx);
void SPI_Write(SPI_TypeDef * SPIx, uint8_t *txBuffer, uint8_t *rxBuffer, int size);
void SPI_Read(SPI_TypeDef *SPIx, uint8_t *rxBuffer, int size);

#endif /* __STM32L476G_DISCOVERY_SPIInit_H */
