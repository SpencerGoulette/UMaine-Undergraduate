#include <stdio.h>

int main(int argc, char **argv) {
	int color;

	//Iterates through 15 times incrementing number by 1 and changing colors when it prints
	for(int i = 1; i < 16; i++)
	{
		color = 30 + i;
		if(color >= 37)
		{
			color += 3;
		}
		printf("\x1b[%dm""#%d:  The Answer to the Ultimate Question is 42""\x1b[0m""\n", color, i);
	}

	return 0;
}
