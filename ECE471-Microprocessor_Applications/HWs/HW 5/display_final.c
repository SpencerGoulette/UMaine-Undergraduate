#include <stdio.h>

#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

#include <sys/ioctl.h>

#include <linux/i2c-dev.h>

#define E 0x79 // E
#define C 0x39 // C
#define F 0x66 // 4
#define S 0x07 // 7
#define O 0x06 // 1

int main(int argc, char **argv) {

	int fd, result, i, j;

	int count = 0; // Location in string counter

	char i2c_device[]="/dev/i2c-1";

	unsigned char buffer[17];

	unsigned char class[6] = {E,C,E,F,S,O}; // ECE471

	/* Open i2c device */
	fd = open(i2c_device, O_RDWR);
	if(fd < 0)
	{
		fprintf(stderr, " Error!\n");
		return 2;
	}

// YOUR CODE HERE

	/* Set slave address */
	result = ioctl(fd, I2C_SLAVE, 0x70);
	if(result < 0)
	{
		fprintf(stderr, " Error!\n");
		return 2;
	}

// YOUR CODE HERE

	/* Turn on oscillator */
	buffer[0] = (0x2<<4) | (0x1);
	result = write(fd, buffer, 1);
	if(result < 0)
	{
		fprintf(stderr, " Error!\n");
		return 2;
	}

// YOUR CODE HERE

	/* Turn on Display, No Blink */
	buffer[0] = (0x8<<4) | (0x1);
	result = write(fd, buffer, 1);
	if(result < 0)
	{
		fprintf(stderr, " Error!\n");
		return 2;
	}

// YOUR CODE HERE

	/* Set Brightness */
	buffer[0] = (0xE<<4) | 0xC;
	result = write(fd, buffer, 1);
	if(result < 0)
	{
		fprintf(stderr, " Error!\n");
		return 2;
	}

// YOUR CODE HERE
	while(1)
	{
		for(j = 0; j < 2; i++)
		{
			for(i = 0; i < 16; i++)
			{
				buffer[i] = 0x00; // If can't assign a character, make zero
				if(i == 1 || i == 3 || i == 7)
				{
					buffer[i] = class[count]; // Assigns the next character
					count++; // Increments to next character in the string
					if(count > 5) // Resets string 
					{
						count = 0; 
					}
				}
			}
			result = write(fd, buffer, 17); // Write the string
			if(result < 0)
			{
				fprintf(stderr, " Error!\n");
				return 2;
			}
			usleep(1000000); // Wait a second
		}
	}

// YOUR CODE HERE

	/* Close device */
	close(fd);

// YOUR CODE HERE

	return 0;
}
