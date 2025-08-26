#include "stm32l476xx.h"
#include "SysClock.h"
#include "LED.h"
#include "UART.h"
#include "SPI.h"
#include "Systick.h"

#include <string.h>

typedef struct {
  float x;  // X axis rotation
  float y;  // Y axis rotation
  float z;  // Z axis rotation 
} L3GD20_Data_t;

int16_t Gyro_X, Gyro_Y, Gyro_Z; 
uint8_t buffer[5];

int main(void){
	uint8_t gyr[6];
  uint8_t status, n;
	uint8_t myID;
	
  L3GD20_Data_t gyro;
	
	System_Clock_Init(); // Switch System Clock = 80 MHz
	//LED_Init();
	sysTick_Initialize(1000);	//Initializes SysTick
	UART2_Init();	// Initializes UART2
	SPI_Init(SPI2);
	L3GD20_Init();
	
	// Two models: L3GD20 (0xD4) and L3GD20_TR (0xD5) 
	GYRO_IO_Read(&myID, 0x0F, 1);
		
	sprintf(buffer,"%X\n\r",myID); // Converts value to string
	delay(500); // Delay 0.2 second
	DMA_Init(buffer, 5);	// Initializes DMA to send string
	
  while(1) {

		GYRO_IO_Read(&status, 0x27, 1);  // Read status register

    if ( (status & 0x08) == 0x08 ) {  // ZYXDA ready bit set
      GYRO_IO_Read(gyr, 0x28, 6);

      // Degrees per second
      // For +/-2000dps, 1 unit equals to 70 milli degrees per second
      gyro.x = ((float)((short)(gyr[1]<<8 | gyr[0]))) * 0.070;
      gyro.y = ((float)((short)(gyr[3]<<8 | gyr[2]))) * 0.070;
      gyro.z = ((float)((short)(gyr[5]<<8 | gyr[4]))) * 0.070;

      Gyro_X = gyr[0] + (gyr[1]<<8);
      Gyro_Y = gyr[2] + (gyr[3]<<8);
      Gyro_Z = gyr[4] + (gyr[5]<<8);
			
			if(gyro.x < 0)
			{
				gyro.x *= -1;
			}
			if(gyro.y < 0)
			{
				gyro.y *= -1;
			}
			if(gyro.z < 0)
			{
				gyro.z *= -1;
			}
			
			//sprintf(buffer,"X=%f Y=%f Z=%f\n\r",gyro.x,gyro.y,gyro.z); // Converts value to string
			if(gyro.x > gyro.y && gyro.x > gyro.z && gyro.x > 20)
			{
				sprintf(buffer,"ROLL\n\r");
				delay(500); // Delay 0.2 second
				DMA_Init(buffer, 60);	// Initializes DMA to send string
				delay(500); // Delay 0.2 second
			}
			else if(gyro.y > gyro.x && gyro.y > gyro.z && gyro.y > 20)
			{
				sprintf(buffer,"PITCH\n\r");
				delay(500); // Delay 0.2 second
				DMA_Init(buffer, 60);	// Initializes DMA to send string
				delay(500); // Delay 0.2 second
			}
			else if(gyro.z > gyro.x && gyro.z > gyro.y && gyro.z > 20)
			{
				sprintf(buffer,"YAW\n\r");
				delay(500); // Delay 0.2 second
				DMA_Init(buffer, 60);	// Initializes DMA to send string
				delay(500); // Delay 0.2 second
			}
		}
  }
}
