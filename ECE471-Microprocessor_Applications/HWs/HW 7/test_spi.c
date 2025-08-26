#include <stdio.h>

#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>

#include <sys/ioctl.h>
#include <linux/spi/spidev.h>

#define LENGTH 3

int main(int argc, char **argv) {

	struct spi_ioc_transfer spi;
        int spi_fd, result, readable;
	float output;
	unsigned char data_out[LENGTH] = {0x1,0x90,0x00}; // Data to send
	unsigned char data_in[LENGTH];	// Data to receive

	/* Open SPI device */
	spi_fd = open("/dev/spidev0.0", O_RDWR);	// Opens SPI device
	if(spi_fd < 0)
	{
		fprintf(stderr, "\tError!");
		return 2;
	}

	/* Set SPI Mode_0 */
	int mode = SPI_MODE_0;
	result = ioctl(spi_fd, SPI_IOC_WR_MODE, &mode);	// Sets SPI_MODE_0
	if(result < 0)
	{
		fprintf(stderr, "\tError!");
		return 2;
	}
	
	int lsb_mode = 0;	// Sets LSB Mode
	result = ioctl(spi_fd, SPI_IOC_WR_LSB_FIRST, &lsb_mode);
	if(result < 0)
	{
		fprintf(stderr, "\tError!");
		return 2;
	}

	/* Loop forever printing the CH0 and CH1 Voltages 	*/
	/* Once per second.*/
	while(1)
	{
		memset(&spi,0,sizeof(struct spi_ioc_transfer));	// Resets

		spi.tx_buf = (unsigned long)&data_out;	// Address of out buffer
		spi.rx_buf = (unsigned long)&data_in;	// Address of in buffer
		spi.len = LENGTH;	// Length in bytes
		spi.delay_usecs = 0;	// Delay
		spi.speed_hz = 100000;	// Speed in Hz
		spi.bits_per_word = 8;	// 1 Byte
		spi.cs_change = 0;	// CS

		result = ioctl(spi_fd, SPI_IOC_MESSAGE(1), &spi);	// Full-Duplex Communication
		if(result < 0)
		{
			fprintf(stderr, "\tError!");
			return 2;
		}

		readable = ((data_in[1] & 0x3) << 8) | data_in[2];	// Reads the bytes in the correct order
		output = ((float)readable) * 3.3 / ((float)1024);	// Converts to Voltage
		printf("%f\n", output);	// Prints the Voltage
		usleep(100000);	// Waits a second
	}

	/* Use the SPI_IOC_MESSAGE(1) ioctl() as described in the class notes */

	return 0;
}
