#include "UART.h"
#include "LED.h"
#include <string.h>


void I2C_Initialization(I2C_TypeDef * I2Cx){
  // Enable the clock of I2C
  RCC->APB1ENR1  |= RCC_APB1ENR1_I2C1EN;		// I2C2 clock enable

  // Reset the I2C (set and reset by software)
  RCC->APB1RSTR1 |= RCC_APB1RSTR1_I2C2RST;
  RCC->APB1RSTR1 &= ~RCC_APB1RSTR1_I2C2RST;
	
	// Address of Master
	uint32_t OwnAddr = 0x52;
	
	// I2C CR1 Configuration
	// When the I2C is disabled (PE=0), the I2C performs a software reset
	I2Cx->CR1 &= ~I2C_CR1_PE;	// Disable I2C
	I2Cx->CR1 &= ~I2C_CR1_ANFOFF; // 0: Analog Noise FIlter Enabled
	I2Cx->CR1 &= ~I2C_CR1_DNF;	// 0000: Digital Filter Disabled
	I2Cx->CR1 |= I2C_CR1_ERRIE;	// Errors Interrupt Enable
	I2Cx->CR1 &= ~I2C_CR1_SMBHEN;	// SMBus Mode: 0 = I2C Mode; 1 = SMBUS Mode
	I2Cx->CR1 &= ~I2C_CR1_NOSTRETCH;	// Enable Clock Stretching
	
	// I2C TIMINGR Configuration
	I2Cx->TIMINGR = 0;
	// SysTimer = 80 MHz, PRESC = 7, 80MHZ/(1+7) = 10MHZ
	I2Cx->TIMINGR &= ~I2C_TIMINGR_PRESC;	// Clear the Prescaler
	I2Cx->TIMINGR |= 7U << 28;	// Set the Clock Prescaler to 7
	I2Cx->TIMINGR |= 49U;	// SCLL: SCL low period 4.7us
	I2Cx->TIMINGR |= 49U << 8;	//SCLH: SCL high period 4.8us
	I2Cx->TIMINGR |= 14U << 20;	//SCLDEL: Data setup time > 1.0 us
	I2Cx->TIMINGR |= 15U << 16;	// SDADEL: Data hold time > 1.25 us
	
	// I2C Own Address 1 register (I2C_OAR1)
	I2Cx->OAR1 &= ~I2C_OAR1_OA1EN;
	I2Cx->OAR1 = I2C_OAR1_OA1EN | OwnAddr;	//7-bit own address
	I2Cx->OAR1 &= ~I2C_OAR2_OA2EN;	// Disable own address 2
	
	// I2C CR2 Configuration
	I2Cx->CR2 &= ~I2C_CR2_ADD10;	// 0 = 7-bit mode, 1 = 10-bit mode enabled
	I2Cx->CR2 |= I2C_CR2_AUTOEND;	// Enable auto end
	I2Cx->CR2 |= I2C_CR2_NACK;	// For slave mode: set NACK
	I2Cx->CR1 |= I2C_CR1_PE;	// Enable I2C
	
	I2Cx->CR1 |= I2C_CR1_RXDMAEN;	// Enables DMA
  I2Cx->CR1 |= I2C_CR1_PE;	   // Enable I2C1
}

void I2C_Start(I2C_TypeDef * I2Cx, uint32_t DevAddress, uint8_t Size, uint8_t Direction)
{
	
	// Direction = 0: Master requests write transfer
	// Direction = 1: Master requests read transfer
	
	uint32_t tmpreg = I2Cx->CR2;
	tmpreg &= (uint32_t)~((uint32_t)(I2C_CR2_SADD | I2C_CR2_NBYTES | I2C_CR2_RELOAD | I2C_CR2_AUTOEND | I2C_CR2_RD_WRN | I2C_CR2_START | I2C_CR2_STOP)); 

	if(Direction == 1)
	{
		tmpreg |= I2C_CR2_RD_WRN;	// Read from Slave
	}
	else
	{
		tmpreg &= ~I2C_CR2_RD_WRN;	// Write to Slave
	}
	
	tmpreg |= (uint32_t)(((uint32_t) DevAddress & I2C_CR2_SADD) | (((uint32_t) Size << 16) & I2C_CR2_NBYTES)); 

	tmpreg |= I2C_CR2_START;
	I2Cx->CR2 = tmpreg;
}

void I2C_Stop(I2C_TypeDef * I2Cx)
{
	// Master: Generate STOP bit after the current byte had been transferred
	I2Cx->CR2 |= I2C_CR2_STOP;
	
	// Waot until STOPF flag is reset
	while((I2Cx->ISR & I2C_ISR_STOPF) == 0);
	
	I2Cx->ISR |= I2C_ICR_STOPCF;	// Write 1 to clear STOPF flag
}

void I2C_WaitLineIdle(I2C_TypeDef * I2Cx)
{
	// Wait until I2C Bus is ready
	while((I2Cx->ISR & I2C_ISR_BUSY) == I2C_ISR_BUSY);	// If busy, wait
}

uint8_t I2C_SendData(I2C_TypeDef * I2Cx, uint8_t SlaveAddress, uint8_t *pData, uint8_t Size)
{
	int i;
	if(Size <= 0 || pData == NULL) return -1;
	
	// Wait until the line is idle
	I2C_WaitLineIdle(I2Cx);
	
	// The last argument: 0 = Sending data to the slave
	I2C_Start(I2Cx, SlaveAddress, Size, 0);
	
	for(i = 0; i < Size; i++)
	{
		
		// TXIS bit is set by hardware when the TXDR register is empty and the
		// data to be transmitted must be written in the TXDR register. It is
		// cleared when the next data to be sent is written in the TXDR register.
		// The TXIS flag is not set whan a NACK is received.
		while((I2Cx->ISR & I2C_ISR_TXIS) == 0);
		
		// TXIS is cleared by writing to the TXDR register
		I2Cx->TXDR = pData[i] & I2C_TXDR_TXDATA;
	}
	
	// Wait until the TC flag is set
	while((I2Cx->ISR & I2C_ISR_TC) == 0 && (I2Cx->ISR & I2C_ISR_NACKF) == 0);
	
	if((I2Cx->ISR & I2C_ISR_NACKF) != 0)
		return -1;
	
	I2C_Stop(I2Cx);
	
	return 0;
}

uint8_t I2C_Receivedata(I2C_TypeDef * I2Cx, uint8_t SlaveAddress, uint8_t *pData, uint8_t Size)
{
	int i;
	
	if(Size <= 0 || pData == NULL) return -1;
	
	I2C_WaitLineIdle(I2Cx);
	
	I2C_Start(I2Cx, SlaveAddress, Size, 1);	// 1 = Receiveing from the Slave
	
	for(i = 0; i < Size; i++)
	{
		// Wait until the RXNE flag is set
		while((I2Cx->ISR & I2C_ISR_RXNE) == 0);
		pData[i] = I2Cx->RXDR & I2C_RXDR_RXDATA;
	}
	
	while((I2Cx->ISR & I2C_ISR_TC) == 0);		// Wait until TRC flag is set
	
	I2C_Stop(I2Cx);
	return 0;
}

void I2C_GPIO_init(void)
{
	// Enable the peripheral clock of GPIO Port
	RCC->AHB2ENR |=   RCC_AHB2ENR_GPIOBEN;
	
	// ********************** USART 2 ***************************
	// PD5 = USART2_TX (AF7)
	// PD6 = USART2_RX (AF7)
	// Alternate function, High Speed, Push pull, Pull up
	// **********************************************************
	// Input(00), Output(01), AlterFunc(10), Analog(11)
	GPIOB->MODER   &= ~(0xF << (2*6));	// Clear bits
	GPIOB->MODER   |=   0xA << (2*6);      		
	GPIOB->AFR[0]  |=   0x44<< (4*6);       	
	// GPIO Speed: Low speed (00), Medium speed (01), Fast speed (10), High speed (11)
	GPIOB->OSPEEDR |=   0xF<<(2*6); 					 	
	// GPIO Push-Pull: No pull-up, pull-down (00), Pull-up (01), Pull-down (10), Reserved (11)
	GPIOB->PUPDR   &= ~(0xF<<(2*6));   				
	// GPIO Output Type: Output push-pull (0, reset), Output open drain (1) 
	GPIOB->OTYPER  |=  0x3<<6 ;       	
}