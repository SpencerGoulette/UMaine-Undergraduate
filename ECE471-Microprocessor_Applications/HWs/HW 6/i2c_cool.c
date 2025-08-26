#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <fcntl.h>

#include "i2c-bitbang.h"

#define A 0xF7
#define B 0xFC
#define C 0xB9
#define D 0xDE
#define E 0xF9
#define F 0xF1
#define G 0xEF
#define H 0xF6
#define I 0x30
#define J 0x9E
#define K 0xF6
#define L 0x38
#define M 0x15
#define N 0x54
#define O 0xBF
#define P 0xF3
#define Q 0xE7
#define R 0x50
#define S 0xED
#define T 0xF8
#define U 0xBE
#define V 0x1C
#define W 0x2A
#define X 0xF6
#define Y 0xEE
#define Z 0xDB

int main(int argc, char **argv) {

	int result;
	unsigned char buffer[17];

	unsigned char string[] = {D,O,N,T,0,G,E,T,0,L,O,S,T,0,I,N,0,T,H,E,0,S,A,U,C,E,0,B,U,T,0,W,I,T,H,O,U,T,0,T,H,E,0,S,A,U,C,E,0,Y,O,U,0,A,R,E,0,L,O,S,T,0}


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

	while(1) {
		for(int j = 0; j < sizeof(string) + 1; j++)
		{
			for(int i = 0; i < 16; i++)
			{
				buffer[i] = 0x0;
				if(i == 0)
				{
					buffer[0] = 0x70 << 1 | 0x00;
				}
				if(i == 2 || i == 4 || i == 8 || i == 10)
				{
					buffer[i] = string[count];
					count++;
					if(count > sizeof(string) - 1)
					{
						count = 0;
					}
				}
			}
			count -= 3;
			if(count < 0)
			{
				count += sizeof(string);
			}
			result = write_i2c(buffer,17);

			usleep(1000000);
		}
	}

	return 0;

}
