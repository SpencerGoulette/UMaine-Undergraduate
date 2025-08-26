/*!
 * @file running_mean.c
 *
 * @brief ECE 486 Spring 2019 Lab 1 running_mean.c calculates the running mean
 *
 * @author ECE486 Lab Group 9
 * @author Spencer Goulette, Jason Millette, Steven Ferrarese
 *
 * @date Feb 4, 2019
 * 
 * Contains three major functions. The first function is the init_running_mean
 * function, which initializes a struct. The second function is the
 * calc_running_mean which takes the input buffer and averages the values
 * and returns an output buffer of the averaged values. The third function
 * is the free_memory function which frees up the memory allocated for the
 * array element in the blockData struct.
 */

/*! 
 * Includes stdio.h for input and output, stdlib.h for freeing memory, and 
 * running_mean.h to use the blockData struct
 */
#include <stdio.h>
#include <stdlib.h>
#include "running_mean.h"

/*!
 * init_running_mean is a function that initializes a blockData struct. The
 * M parameter is assigned to the M element. The blockSize parameter is
 * assigned to the blockSize element. 0 is assigned to position element so
 * that the position recorded is the first position. Memory of size M number
 * of doubles is allocated for the array element. 0.0 is assigned to the
 * total element to sum up the inputs to be averaged. The blockData struct
 * is then returned.
 */
struct blockData init_running_mean(int M, int blockSize)
{
	struct blockData data;
	data.M = M;
	data.blockSize = blockSize;
	data.position = 0;
	data.array = (double*)malloc(sizeof(double)*M);
	data.total = 0.0;

	return data;
}

/*!
 * calc_running_mean takes the running mean from a buffer of floats. The
 * running mean is then saved to another buffer. The address for the input
 * buffer is obtained from the x parameter. The address for the output buffer
 * is obtained from the y parameter. The running mean works by having the
 * function take the nth element of the input buffer and adding it to the array
 * in the blockData struct called data. The array is then totalled and the
 * mean is calculated and assigned to the nth element of the output buffer.
 * The position element in the struct is then increased. The position element
 * is used for the position of the array in the struct, while n is used for
 * position of the x input buffer. Once the array has reached M elements its
 * position goes back to the start to replace the oldest elements in the array.
 * After the for loop has gone through all the elements in the input buffer,
 * the loop exits and the struct is returned primarily to save the position
 * element in the struct. This allows for the calc_running_mean function to 
 * constantly keep going.
 */
struct blockData calc_running_mean(double *x, double *y, struct blockData data)
{
	for(int n = 0; n < data.blockSize; n++)
	{
		data.array[data.position] = x[n];
		for(int i = 0; i < data.M; i++)
		{
			data.total += data.array[i];
		}
		y[n] = data.total / data.M;
		data.position += 1;
		data.total = 0;
		if(data.position >= data.M)
		{
			data.position = 0;
		}
	}

	return data;
}

/*!
 * The free_memory function takes in a blockData struct and frees up the
 * memory allocated for the array element in the struct.
 */
void free_memory(struct blockData data)
{
	free(data.array);
}
