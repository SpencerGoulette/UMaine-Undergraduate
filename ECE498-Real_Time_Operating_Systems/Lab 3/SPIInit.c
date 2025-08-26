#include "stm32l476xx.h"
#include "SYSTICK.h"
#include "LCD.h"
#include "GPIOInit.h"
#include "HSI_Init.h"
#include "SPIInit.h"
#include "GYRO_Init.h"

void SPI_Init(SPI_TypeDef * SPIx)
{
	// GPIO PIN Init For SPI 
	// Enable the clock to GPIO Port D, E, and B for the Red led
	RCC->AHB2ENR |= RCC_AHB2ENR_GPIODEN|RCC_AHB2ENR_GPIOEEN|RCC_AHB2ENR_GPIOBEN|RCC_AHB2ENR_GPIOCEN;
	
	GPIOB->MODER &= ~GPIO_MODER_MODE2;				//red LED for output
	GPIOB->MODER |= GPIO_MODER_MODE2_0;
	GPIOB->PUPDR &= ~GPIO_PUPDR_PUPD2;				//push pull
	
	// PD7 = OUTPUT, PD2 = INPUT, PE8 = INPUT
	GPIOD->MODER &= ~(GPIO_MODER_MODER7|GPIO_MODER_MODER2);
	GPIOD->MODER |= GPIO_MODER_MODER7_0;
	
	GPIOE->MODER &= ~(GPIO_MODER_MODER8);
		
	// Set mode of PD1(clock), PD3(MISO), PD4(MOSI) to AF (10)
	GPIOD->MODER	&= ~(GPIO_MODER_MODER1|GPIO_MODER_MODER3|GPIO_MODER_MODER4);
	GPIOD->MODER	|= GPIO_MODER_MODER1_1|GPIO_MODER_MODER3_1|GPIO_MODER_MODER4_1;
	
	// Pull up on PD3 (MISO)
	GPIOD->PUPDR |= GPIO_PUPDR_PUPD3_0;
	
	// PD1, PD3, PD4, output speed set to high
	GPIOD->OSPEEDR |= (GPIO_OSPEEDR_OSPEED1|GPIO_OSPEEDR_OSPEED3|GPIO_OSPEEDR_OSPEED4);
		
	// Select Function 5 SPI1/SPI2
	GPIOD->AFR[0]	&= ~(GPIO_AFRL_AFSEL1|GPIO_AFRL_AFSEL3|GPIO_AFRL_AFSEL4);
	GPIOD->AFR[0]	|= GPIO_AFRL_AFSEL1_0|GPIO_AFRL_AFSEL1_2;
	GPIOD->AFR[0]	|= GPIO_AFRL_AFSEL3_0|GPIO_AFRL_AFSEL3_2;
	GPIOD->AFR[0]	|= GPIO_AFRL_AFSEL4_0|GPIO_AFRL_AFSEL4_2;
	
//--------------------------- End of GPIO Init ---------------------------
	
	if(SPIx == SPI1) {
		//Enable SPI clock
		RCC->APB2ENR |= RCC_APB2ENR_SPI1EN;	//Enable SPI1 clock
		RCC->APB2RSTR |= RCC_APB2RSTR_SPI1RST;	//Reset SPI1
		RCC->APB2RSTR &= ~RCC_APB2RSTR_SPI1RST;	//Clear the reset of SPI1
	} else if(SPIx == SPI2) {
		RCC->APB1ENR1 |= RCC_APB1ENR1_SPI2EN;	//Enable the SPI2 clock
		RCC->APB1RSTR1 |= RCC_APB1RSTR1_SPI2RST;	//Reset SPI2
		RCC->APB1RSTR1 &= ~RCC_APB1RSTR1_SPI2RST;	//Clear the reset of SPI2
	} else if(SPIx == SPI3) {
		RCC->APB1ENR1 |= RCC_APB1ENR1_SPI3EN;	//Enable SPI3
		RCC->APB1RSTR1 |= RCC_APB1RSTR1_SPI3RST;	//Reset SPI3
		RCC->APB1RSTR1 &= ~RCC_APB1RSTR1_SPI3RST;	//Clear the reset of SPI3
	}
	
	SPIx->CR1 &= ~SPI_CR1_SPE;	//Disable SPI
	
	//Configure duplex or receive-only
	//0 = Full duplex (transmit and receive), 1 = receive-only
	SPIx->CR1 &= ~SPI_CR1_RXONLY;
	
	//Bidirectional data mode enable: This bit enables half-duplex
	// communicatoin using common single bidirectional data line
	// 0 = 2-line uniderectional data mode selected
	//1 = 1-line bidirectional data mode selected
	SPIx->CR1 &= ~SPI_CR1_BIDIMODE;
	
	//output enable in bidirectional mode
	//0 = Output disable (recieve-only mode)
	//1 = output enable (transmit-only mode)
	SPIx->CR1 &= ~SPI_CR1_BIDIOE;
	
	//Data frame format
	SPIx->CR2 &= ~SPI_CR2_DS;
	SPIx->CR2 = (SPI_CR2_DS_0 | SPI_CR2_DS_1 | SPI_CR2_DS_2);	//0111: 8 bit
	
	//bit order
	//0 = MSB 
	//1 = LSB
	SPIx->CR1 &= ~SPI_CR1_LSBFIRST;	//most significant bit first
	
	//clock phase
	//0 = the first clock transition is the first data capture edge
	// 1 = the second clock transition is the first data capture edge
	SPIx->CR1 &= ~SPI_CR1_CPHA;	//1st edge
	
	//Clock polarity
	//0 = set CK to 0 when idle
	//1 = set CK to 1 when idle
	SPIx->CR1 &= ~SPI_CR1_CPOL;	//polarity low
	
	// Buad rate:
	// 000 = f_PCLK/2	001 = f_PCLK/4		010 = f_PCLK/8		011 = f_PCLK/16
	// 100 = f_PCLK/32	101 = f_PCLK/64	110 = f_PCLK/128	111 = f_PCLK/256
	// Set baudrate to 5MHz
	SPIx->CR1 |= 0x01 << 3;	// 16MHz / 4 = 4MHz
	
	//CRC polynomial
	SPIx->CRCPR = 10;
	
	//Hardware CRC calculation disabled
	SPIx->CR1 &= ~SPI_CR1_CRCEN;
	
	//Frame format: 0 = SPI Motorola mode, 1 = SPI TI mode
	SPIx->CR2 &= ~SPI_CR2_FRF;
	
	//NSSGPIO: The value of SSI is forced onto the NSS pin and the io value
	//of the NSS pin is ignored
	//1 = software slave management enabled
	//0 = hardware NSS management enabled
	SPIx->CR1 |= SPI_CR1_SSM;
	
	//set as master 0 = slave, 1 = master
	SPIx->CR1 |= SPI_CR1_MSTR;
	
	//Manage NSS (slave selection) by using software
	SPIx->CR1 |= SPI_CR1_SSI;
	
	//Enable NSS pusle management
	SPIx->CR2 |= SPI_CR2_NSSP;
	
	//Receive buffer not empty (RXNE)
	//The RXNE flag is set to depending on the FRXTH bit value in the SPIx_CR2 register:
	// (1) if FRXTH is set, RXNE goes high and stays high unitl the RXFIFO level is
	//	greater or equal to 1/4 (8 bit)
	// (2) if FRXTH is cleared, RXNE goes high and stays high until the RXFIFO level is 
	//	higher then or equal to 1/2 (16 bit)
	SPIx->CR2 |= SPI_CR2_FRXTH;
	
	//SPI enable
	SPIx->CR1 |= SPI_CR1_SPE;
}

void SPI_Write(SPI_TypeDef * SPIx, uint8_t *txBuffer, uint8_t *rxBuffer, int size) {
	int i = 0;
	
	for ( i = 0; i < size; i++) {
		//wait for TXE (Transmit buffer empty)
		while( (SPIx->SR & SPI_SR_TXE) != SPI_SR_TXE);
		SPIx->DR = txBuffer[i];
		
		//wait for RXNE (Recieve buffer not empty
		while((SPIx->SR & SPI_SR_RXNE) != SPI_SR_RXNE);
		rxBuffer[i] = SPIx->DR;
	}
	
	//wait for BSY flag cleared
	while( (SPIx->SR & SPI_SR_BSY) == SPI_SR_BSY);
}

void SPI_Read(SPI_TypeDef *SPIx, uint8_t *rxBuffer, int size) {
	int i = 0;
	for ( i = 0; i < size; i++) {
		//wait for TXE (Transmit buffer empty)
		while( (SPIx->SR & SPI_SR_TXE) != SPI_SR_TXE);
		//the clock is controlled by master
		//thus, the master must send a byte
		SPIx->DR = 0xFF;	//A dummy byte
		
		//data to the slave to start the clock
		while( (SPIx->SR & SPI_SR_RXNE) != SPI_SR_RXNE);
		rxBuffer[i] = SPIx->DR;
	}
	
	//wait for BSY flag cleared
	while( (SPIx->SR & SPI_SR_BSY) == SPI_SR_BSY);
}
