//Spencer Goulette
//HW_1 COS_221
//Sept. 13, 2017

#include<iostream>
#include<string>
#include<sstream>
using namespace std;

bool isPalindrome(const string& s); //Function that takes in a string to determine whether or not the string is a palindrome

int main()
{
	string userString;
	const string validString("Able was I ere I saw Elba"); //Valid string to test program
	const string notAValidString("Boo Hoo Hoo"); //Invalid string to test program
	if(isPalindrome(validString) != false) //Testing the two strings
	{
		cout<<validString<<" is a palindrome!"<<endl<<endl;
	}
	else
	{
		cout<<validString<<" is NOT a palindrome!"<<endl<<endl;
	}
	if(isPalindrome(notAValidString) != false)
	{
		cout<<notAValidString<<" is a palindrome!"<<endl<<endl;
	}
	else
	{
		cout<<notAValidString<<" is NOT a palindrome!"<<endl<<endl;
	}
	while(userString != "q") //Allows for User to enter their own string
       	{
		cout<<"Enter something else to test if it is a Palindrome! Type 'q' to quit"<<endl;
		getline(cin,userString,'\n');
		if(userString != "q")
		{
			if(isPalindrome(userString) != false)
			{
				cout<<userString<<" is a palindrome!"<<endl<<endl;
			}
			else
			{
				cout<<userString<<" is NOT a palindrome!"<<endl<<endl;
			}
		}
	}
	cout<<"Spencer Goulette COS-221"<<endl;
}

bool isPalindrome(const string& s) //Function that takes in a string to determine whether or not the string is a palindrome
{
	string sReverse = "";
	string sNotConstant = "";
	string sReplace;
	int stringLength = s.length();

	for(int i=0; i<stringLength; i++) //creates a non-constant copy of s
	{
		sNotConstant.append(s, i, 1);
	}

	for(int i=0; i<stringLength; i++) //Makes all letters in sNotConstant lowercase
	{
		if(((int)sNotConstant.at(i))>64 && ((int)sNotConstant.at(i))<91) //Checks to see if uppercase using ASCII values and replaces uppercase with lowercase
		{
			stringstream temp;
			char x = ((int)sNotConstant.at(i)+32);
			temp<<x;
			sReplace = temp.str();
			sNotConstant.replace(i, 1, sReplace);
		}	
	}

	for(int i=0; i<stringLength+1; i++) //Making sReverse the reverse of sNotConstant
	{
		sReverse.append(sNotConstant, stringLength-i, 1);
	}

	if(sNotConstant.compare(sReverse)!=0) //Checks if sNotConstant and sReverse are the same
	{
		return false;
	}
	else
	{
		return true;
	}
}
