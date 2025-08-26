#include "stm32l476xx.h"
#include "SYSTICK.h"
#include "LCD.h"
#include "GPIOInit.h"
#include "HSI_Init.h"
#include "SPIInit.h"
#include "GYRO_Init.h"

// PD7: GYRO_CS (High = I2C, LOW = SPI)
#define L3GD20_CS_LOW		GPIOD->ODR &= ~(1U << 7);
#define L3GD20_CS_HIGH		GPIOD->ODR |=  (1U << 7);

void GYRO_IO_Write(uint8_t *pBuffer, uint8_t WriteAddr, uint8_t size){
	
	uint8_t rxBuffer[32];
	
	if(6 > 0x01) {             //6 is a guess based on the call in main.c
		WriteAddr |= 1U << 6; // Select the mode of writing multiple-byte
	}
	
	// Set SPI interface
	L3GD20_CS_LOW; // 0 = SPI, 1 = I2C
	Delay(10);		 // Short delay
	
	// Send the address of the indexed register
	SPI_Write(SPI2, &WriteAddr, rxBuffer, 1);
	
	// Send the data that will be written into the device
	// Bit transfer order: Most significant bit first
	SPI_Write(SPI2, pBuffer, rxBuffer, size);
	
	// Set chip select High at the end of the transmission
	Delay(10);			// Short delay
	L3GD20_CS_HIGH; // 0 = SPI, 1 = I2C

}

void GYRO_IO_Read(uint8_t *pBuffer, uint8_t ReadAddr, uint8_t size){
	
	uint8_t rxBuffer[32];
	
	// Select read & multiple-byte mode
	uint8_t AddrByte = ReadAddr | 1U << 7 | 1U << 6;
	
	// Set chip select low at the start of the transmission
	L3GD20_CS_LOW;	// 0 = SPI, 1 = I2C
	Delay(10);			// Short delay
	
	// Send the address of the indexed register
	SPI_Write(SPI2, &AddrByte, rxBuffer, 1);
	
	// Recieve the data that will be read from the device (MSB First)
	SPI_Read(SPI2, pBuffer, size);
	
	// Set chip select High at the end of the transmission
	Delay(10);			// Short delay
	L3GD20_CS_HIGH; // 0 = SPI, 1 = I2C
}
