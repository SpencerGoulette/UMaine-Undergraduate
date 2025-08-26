/*!
 * @file Lab1.c
 *
 * @brief ECE 486 Spring 2019 Lab 1 testing file to test running mean functions
 *
 * @author ECE486 Lab Group 9
 * @author Spencer Goulette, Jason Millette, Steven Ferrarese
 *
 * @date Feb 4, 2019
 *
 * A simple program to test the running mean functions and print the results
 *
 */

#include <stdio.h>
#include "running_mean.h"

/*! print_block function to print the input and output buffers*/
void print_block(double *block, int size, int output);

/*!
 * @brief Test routing for the init_running_mean, calc_running_mean, and
 * 	  free_memory functions 
 * 
 *  Prints the test number, M and Block Size. The input and output arrays are
 *  then created. The struct for the running mean in then created. The input
 *  buffer is then printed. The running mean is then calculated and then the
 *  output buffer is then printed. The memory allocated for the array in the
 *  struct is then freed. Different tests are done to test the different 
 *  values for M and Block Size.
 *
 * @returns Returns 0 on success.
 */
int main(void)
{
	printf("Test 1: \n M = 3, Block Size = 5\n\n");	//!< Test 1
	double x1[5] = {1,2,3,4,5};
	double y1[5];
	struct blockData d1 = init_running_mean(3,5);
	print_block(x1, 5, 0);
	d1 = calc_running_mean(x1, y1, d1);
	print_block(y1, 5, 1);
	free_memory(d1);

	printf("Test 2: \n M = 4, Block Size = 4\n\n"); //!< Test 2
	double x2[4] = {2,4,6,8};
	double y2[4];
	struct blockData d2 = init_running_mean(4,4);
	print_block(x2, 4, 0);
	d2 = calc_running_mean(x2, y2, d2);
	print_block(y2, 4, 1);
	free_memory(d2);

	printf("Test 3: \n M = 9, Block Size = 6\n\n"); //!< Test 3
	double x3[6] = {1,1,2,3,2,1};
	double x4[6] = {2,2,1,1,1,2};
	double x5[6] = {1,3,1,2,1,2};
	double y3[6];
	double y4[6];
	double y5[6];
	struct blockData d3 = init_running_mean(9,6);
	print_block(x3, 6, 0);
	print_block(x4, 6, 0);
	print_block(x5, 6, 0);
	d3 = calc_running_mean(x3, y3, d3);
	d3 = calc_running_mean(x4, y4, d3);
	d3 = calc_running_mean(x5, y5, d3);
	print_block(y3, 6, 1);
	print_block(y4, 6, 1);
	print_block(y5, 6, 1);
	free_memory(d3);

	return 0;
}

/*!
 * @brief Print function to print input and output buffer
 *
 * If output is true, then y[n] is printed, else x[n] is printed. The function
 * then goes through the each element in the buffer and prints it.
 */
void print_block(double *block, int size, int output)
{
	if(output == 0)
	{
		printf("x[n]: ");
	}
	else
	{
		printf("y[n]: ");
	}
	for(int i = 0; i < size; i++)
	{
		printf("%-3lf ", block[i]);
	}
	printf("\n\n");

	return;
}
