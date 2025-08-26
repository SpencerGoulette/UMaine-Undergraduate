#include <stdio.h>

#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

#include <sys/ioctl.h>

#include <linux/i2c-dev.h>

int main(int argc, char **argv) {

	int fd, result, i;

	char i2c_device[]="/dev/i2c-1";

	unsigned char buffer[17];

	/* Open i2c device */
	fd = open(i2c_device, O_RDWR); // Opens the I2C device
	if(fd < 0) // Error Checking
	{
		fprintf(stderr, " Error!\n");
		return 2;
	}

// YOUR CODE HERE

	/* Set slave address */
	result = ioctl(fd, I2C_SLAVE, 0x70); // Sets slave address
	if(result < 0) // Error Checking
	{
		fprintf(stderr, " Error!\n");
		return 2;
	}

// YOUR CODE HERE

	/* Turn on oscillator */
	buffer[0] = (0x2<<4) | (0x1); // Turns on oscillator
	result = write(fd, buffer, 1);
	if(result < 0) // Error checking
	{
		fprintf(stderr, " Error!\n");
		return 2;
	}

// YOUR CODE HERE

	/* Turn on Display, No Blink */
	buffer[0] = (0x8<<4) | (0x1); // No Blink
	result = write(fd, buffer, 1); // Error Checking
	if(result < 0)
	{
		fprintf(stderr, " Error!\n");
		return 2;
	}

// YOUR CODE HERE

	/* Set Brightness */
	buffer[0] = (0xE<<4) | 0xC; // Brightness 12
	result = write(fd, buffer, 1); 
	if(result < 0) // Error Checking
	{
		fprintf(stderr, " Error!\n");
		return 2;
	}

// YOUR CODE HERE

	/* Write 1s to all Display Columns */
	buffer[0] = 0x0;
	for(i = 0; i < 16; i++) // Writes 1s to all display columns
	{
		buffer[1+i] = 0xff;
	}
	result = write(fd, buffer, 17);
	if(result < 0) // Error Checking
	{
		fprintf(stderr, " Error!\n");
		return 2;
	}

// YOUR CODE HERE

	/* Close device */
	close(fd);

// YOUR CODE HERE

	return 0;
}
