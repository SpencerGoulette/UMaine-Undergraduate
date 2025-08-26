//Spencer Goulette
//HW_2 COS_221
//Sept. 19, 2017

#include <iostream>

using namespace std;

int findSmallestInt(const int* x,const int size); //Function that takes an array of ints and its size and returns the smallest int

int main(int argc,char **argv)
{
	int list[8] = {1,2,4,5,10,100,2,-22}; //Test array
	int sizeOfList = 8; //Test array's size
	cout<<findSmallestInt(list, sizeOfList)<<endl<<endl<<"©pencer Goulette COS-221"<<endl;	
}	

int findSmallestInt(const int* x,const int size) //Function that takes an array of ints and its size and returns the smallest int
{
	int smallestInt = x[0]; 
	for(int i = 1; i < (size); i++) //Goes through all the elements in the list and assigns the smallest to smallestInt
	{
		if(x[i] < smallestInt)
		{
			smallestInt = x[i];
		}
	}
	return smallestInt;
}
