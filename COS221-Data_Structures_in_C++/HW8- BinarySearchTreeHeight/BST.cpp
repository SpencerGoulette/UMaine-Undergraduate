#include <iostream>
#include <string>
#include "BST.h"

using namespace std;

BST<string> Tree;

void addToBST(const string& addString);

void siftThroughString(const string& userString);

int main()
{
	const string test = "DURING the whole of a dull, dark, and soundless day in the autumn of the year, when the clouds hung oppresively low in the heavens, I had been passing alone, on horseback, through a singularly dreary tract of country; and at length found myself, as the shades of the evening drew on, within view of the melancholy House of Usher.";

	cout << "Tree in inorder traversal: " << endl << endl;

	siftThroughString(test);

	Tree.inorder();

	int treeHeight = Tree.height();

	cout << endl << endl << "The height of the tree: " << treeHeight << endl;
}

void addToBST(const string& addString)
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
			Tree.insert(addString.substr(i - counter, counter));
			counter = 0;
		}
		tempI = i;
	}
	Tree.insert(addString.substr(tempI - counter + 1, counter));	//Makes sure to include the last word since there is no space after it
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
	addToBST(temp);	//Adds words from the new string to the Linked List.
}
