#include <iostream>
#include <vector>

using namespace std;

int main()
{
	int vectorInput;	//Variable for User's number input
	vector<int> userVector;	//Vector to store the numbers
	int counter = 1;	//Counter to count consecutive numbers
	int maxValueIndex;	//Variable for the Index
	int maxValue;		//Variable for amount in a row

	cout << "User, enter a sequence of numbers (end sequence with a 0): " << endl << endl;	//Asks user to enter the sequence of numbers
	
	while(cin >> vectorInput && vectorInput != 0)	//Adds sequence of numbers to vector
	{
		userVector.push_back(vectorInput);
	}

	int n = userVector.size();	//Made a variable named n to easily show it is an O(n) program
	
	if(n == 0)	//Case in which nothing was added, says 0
	{
		return 0;
	}

	for(int i = 0; i < n - 1; i++)	//Goes through each number to check and see if the next number is the same
	{
		if(userVector.at(i) == userVector.at(i+1))	//If next number is the same, it increases the counter
		{
			counter++;
		}
		else	//If the next number is not the same, it decreases the counter
		{
			counter = 1;
		}
		if(maxValue < counter)	//Finds how many numbers there are in a row and where the index is that it began at
		{
			maxValue = counter;
			maxValueIndex = i - maxValue + 3;
		}
	}

	cout << endl << "The longest same number sequence starts at index " << maxValueIndex << " with " << maxValue << " values of " << userVector.at(maxValueIndex) << endl;	//Prints Results
}
