/*!
 * @file running_mean.h
 *
 * @brief ECE 486 Spring 2019 Lab 1 running_mean header file for struct and function declarations
 *
 * @author ECE Lap Group 9
 * @author Spencer Goulette, Jason Millette, Steven Ferrarese
 *
 * @date Feb 4, 2019
 *
 * running_mean.h defines the struct blockData. This structure is used to save the number to 
 * average over, M, the size of the input buffer, blockSize, the position that the next double
 * will be stored in the struct, position, the total that has been summed over M numbers, total,
 * and the array where the numbers from the input are stored, array, which is an array M big.
 */

#ifndef RUNNING_MEAN_H
#define RUNNING_MEAN_H

/*! blockData structure to save M, blockSize, position, total, and array*/
struct blockData {
	int M;
	int blockSize;
	int position;
	double total;
	double *array;
};

/*! init_running_mean declaration, which declares the blockData struct to be used.  
 *  calc_running_mean declaration, which takes the input and averages the values you out.
 *  free_memory declaration, which takes the blockData struct and free's the memory of the array.*/
struct blockData init_running_mean(int M, int blockSize);
struct blockData calc_running_mean(double *x, double *y, struct blockData data);
void free_memory(struct blockData data);
#endif
