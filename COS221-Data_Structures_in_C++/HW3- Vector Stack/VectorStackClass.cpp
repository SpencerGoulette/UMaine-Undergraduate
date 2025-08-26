/*Spencer ©Goulette
*COS 221 HW 3
09/26/17*/

#include <iostream>
#include <vector>
#include "genericStack.h" //Including the header file to use the genericStack vector

using namespace std;

int main() {
	Stack<string> stringStack;
	cout << "Is the stack empty? "<< stringStack.empty() << endl << "Pushing on Bird, Cat, and Dog..." << endl << endl; //Checking to see if stack is empty then pushing on Bird, Cat, and Dog
	stringStack.push("Bird");
	stringStack.push("Cat");
	stringStack.push("Dog");

	cout << "What's on the top of the stack? " << stringStack.peek() << endl; //Checking what's on top of the stack, the size of the stack, and if the stack is empty
	cout << "Size of the stack: " << stringStack.getSize() << endl;
	cout << "Is the stack empty? " <<  stringStack.empty() << endl << "Popping off Dog and Cat..." << endl << endl; //Popping off Dog and Cat
	stringStack.pop();
	stringStack.pop();

	cout << "What's on the top of the stack? " << stringStack.peek() << endl; //Checking what's on top of the stack, the size of the stack, and if the stack is empty
	cout << "Size of the stack: " << stringStack.getSize() << endl;
	cout << "Is the stack empty? " << stringStack.empty() << endl << "Popping off Bird..." << endl << endl; //Popping off Bird
	stringStack.pop();

	cout << "Is the stack empty? " << stringStack.empty() << endl; //Double checking that the stack is empty
	
	cout << "Spencer Goulette COS-221" << endl;

	return 0;
}

