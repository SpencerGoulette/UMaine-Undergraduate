#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <fcntl.h>

#include "i2c-bitbang.h"

#define A 0x77
#define B 0x7C
#define C 0x39
#define D 0x5E
#define E 0x79
#define F 0x71
#define G 0x6F
#define H 0x76
#define I 0x30
#define J 0x1E
#define K 0x76
#define L 0x38
#define M 0x15
#define N 0x54
#define O 0x3F
#define P 0x73
#define Q 0x67
#define R 0x50
#define S 0x6D
#define T 0x78
#define U 0x3E
#define V 0x1C
#define W 0x2A
#define X 0x76
#define Y 0x6E
#define Z 0x5B

int main(int argc, char **argv) {

	int result;
	unsigned char buffer[17];

	unsigned char string[] = {W,H,Y,0,D,O,N,T,0,Y,O,U,0,C,A,L,L,0,Y,O,U,R,0,M,E,N,T,O,S,0,P,A,G,E,0,M,O,M,E,N,T,O,S,0};	// String to be written
	
	/*******************************************/
	/* Init the GPIO lines we are going to use */
	/* to bitbang the i2c                      */
	/*******************************************/
	result=i2c_init_gpios(SDA_GPIO,SCL_GPIO);
	if (result<0) {
		exit(1);
	}


	/****************************************/
	/****************************************/
	/* Start the display			*/
	/****************************************/
	/****************************************/

	/* Address of device, and we want to write */
        buffer[0]= 0x70<<1 | 0x0;
	/* Command 0x20 = SYSTEM SETUP  (See p30 of manual) */
	/* Action  0x01 = Turn on oscillator */
        buffer[1]= 0x20 | 0x01;

	/* Write the two bytes in our buffer */
	result=write_i2c(buffer,2);
        if ( result<0 ) {
                fprintf(stderr,"Error starting display (enable oscilator)!\n");
                return -1;
        }

	/****************************************/
	/****************************************/
	/* Turn display on, no blinking		*/
	/****************************************/
	/****************************************/

	/* Address of device, and we want to write */
        buffer[0]= 0x70<<1 | 0x0;

	/* Command = 0x80 Setup*/
	/* Action = Blinking off, display on */
        buffer[1]= 0x80 | 0x1;

	/* Write the two bytes in our buffer */
	result=write_i2c(buffer,2);
        if ( result<0 ) {
                fprintf(stderr,"Error starting display (turning on)!\n");
                return -1;
        }



	/****************************************/
	/****************************************/
	/* Set Brightness			*/
	/****************************************/
	/****************************************/

	/* Address of device, and we want to write */
        buffer[0]= 0x70<<1 | 0x0;

	/* Command = 0xe0 Dimming */
	/* Action = Brightness = 10/16 */
        buffer[1]= 0xe0 | 0xa;

	/* Write the two bytes in our buffer */
	result=write_i2c(buffer,2);
        if ( result<0 ) {
                fprintf(stderr,"Error setting brightness!\n");
                return -1;
        }

	while(1) {	// Always writing
		int count = 0;	// String character counter
		for(int j = 0; j < sizeof(string) + 1; j++)	// Loop for all possible displays of the string
		{
			for(int i = 0; i < 16; i++)	// Loop for the buffer
			{
				buffer[i] = 0x0;
				if(i == 0)
				{
					buffer[0] = 0x70 << 1 | 0x00; // Address of device, and we want to write
				}
				if(i == 2 || i == 4 || i == 8 || i == 10) // Letters of string
				{
					buffer[i] = string[count]; // assign character to the buffer
					count++;	// Go to the next character
					if(count > sizeof(string) - 1)	// If at end of string, reset
					{
						count = 0;
					}
				}
			}
			count -= 3; // Starts display at next character
			if(count < 0)
			{
				count += sizeof(string); // Wraps around the string if at end
			}
			result = write_i2c(buffer,17); // Writes the output to the device

			usleep(250000); // Waits a quarter of a second
		}
	}

	return 0;

}
