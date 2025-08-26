/*Spencer Goulette
 *COS-221 HW 05
 10/18/17*/
#include <iostream>
#include <string>

using namespace std;

void displayPermutation(const string& s);	//Helper Function

void displayPermutation(const string& s1, const string& s2);	//Permutation Function

int main()
{
	string userString;
	cout<<"User, enter a string: "<<endl;	//Gets User's string
	getline(cin, userString);
	cout<<endl<<"The Permutations for your string are: "<<endl<<endl;
	displayPermutation(userString);		//Calls the Permutation Function
	cout<<endl<<"Spencer Goulette"<<endl;
}

void displayPermutation(const string& s)	//Helper Function
{
	displayPermutation("", s);
}

void displayPermutation(const string& s1, const string& s2)	//Permutation Function
{
	string s1Sub = "";
	string s2Sub = "";
	if(s2.compare("") == 0)
	{
		cout<<s1<<endl;
	}
	else
	{
		for(int i = 0; i < s2.length(); i++)
		{
		s1Sub.assign(s1);
		s2Sub.assign(s2);
		s1Sub.append(1,s2.at(i));
		displayPermutation(s1Sub, s2Sub.erase(i,1));
		}	
	}
}
