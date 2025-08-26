//Spencer Goulette
//COS 221 HW 07
//11/01/17

#include <iostream>
#include <string>
#include "linkedList.h"

using namespace std;

void addToList(const string& addString);	//Function to add words to the Linked List

void siftThroughString(const string& userString);	//Function that removes the punctuation from a string

void printList(const LinkedList<string>& testList);	//Function that prints the elements in the Linked List

LinkedList<string> List;	//The Linked List

int main()
{
	string wordToRemove = "of";

	const string test = "DURING the whole of a dull, dark, and soundless day in the autumn of the year, when the clouds hung oppressively low in the heavens, I had been passing alone, on horseback, through a singularly dreary tract of country; and at length found myself, as the shades of the evening drew on, within view of the melancholy House of Usher.";
	
	addToList(test);	//Adds the words of test to the Linked List and keeps that punctuation
	
	cout << "What's in the Linked List: " << endl << endl;

	printList(List);	//Prints the Linked List
	
	List.clear();		//Clears the Linked List
	
	siftThroughString(test);	//Removes the punctuation before adding the words of test to the Linked List

	List.remove(wordToRemove);	//Removes the word 'of' from the Linked List

	cout << "What's in the Linked List after removing punctuation and '" << wordToRemove << "': " << endl << endl;

	printList(List);	//Prints the new Linked List

	cout << "Spencer Goulette" << endl;
}

void addToList(const string& addString)
{
	int counter = 0;
	int tempI = 0;
	for(int i = 0; i < addString.size(); i++)	//Goes through all characters in the string
	{
		if(!isspace(addString.at(i)))		//Everytime the character isn't a space, it counts up by 1.
		{
			counter++;
		}
		else			//When there is a space, it finds the word right before the space by using the counter and current index
		{
			List.add(addString.substr(i - counter, counter));
			counter = 0;
		}
		tempI = i;
	}
	List.add(addString.substr(tempI - counter + 1, counter));	//Makes sure to include the last word since there is no space after it
}

void siftThroughString(const string& userString)
{
	string temp = "";
	temp.assign(userString);
	for(int i = 0; i < temp.size(); i++)	//If it detects any of the characters in the string of being not a space or alpha character, it removes it. A way of removing the punctuation
	{
		if(!isalpha(temp.at(i)) && !isspace(temp.at(i)))
		{
			temp.erase(i, 1);
		}
	}
	addToList(temp);	//Adds words from the new string to the Linked List.
}

void printList(const LinkedList<string>& testList)
{
	for(int i = 0; i < testList.getSize(); i++)	//Goes through each element in the Linked List and prints it
	{
		cout << testList.get(i) << " ";
	}
	cout << endl << endl;
}
