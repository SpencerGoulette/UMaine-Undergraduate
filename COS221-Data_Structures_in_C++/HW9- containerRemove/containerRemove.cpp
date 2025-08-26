//Spencer Goulette
//COS 221 HW 9
//11/10/17
#include <iostream>
#include <vector>	//Only including vector because that is all that the homework asks for

using namespace std;

template<typename ContainerType>	//Function to print the container
void print(ContainerType& container);

template<typename ElementType, typename ContainerType>		//Function to remove an element out of the container
void remove(ContainerType& container, const ElementType& value);

int main()
{
	vector<int> v1;

	v1.push_back(1);	//Pushing on numbers 1-6
	v1.push_back(2);
	v1.push_back(3);
	v1.push_back(4);
	v1.push_back(5);
	v1.push_back(6);

	remove(v1, 4);		//Removing 4 from the container twice
	remove(v1, 4);
}

template<typename ContainerType>	//Function to print the container
void print(ContainerType& container)
{
	typename ContainerType::iterator it;	//Using an iterator to make it easier to go through the container
	cout << "container" << ":";
	for(it = container.begin(); it != container.end(); ++it)	//Goes through each of the elements in the container with an iterator and dereferences it to print it
	{
		cout << " " << *it;
	}
	cout << endl;
	return;
}

template<typename ElementType, typename ContainerType>		//Function to remove an element out of the container
void remove(ContainerType& container, const ElementType& value)
{
	typename ContainerType::iterator it;		//Using an iterator to make it easier to go through the container
	print(container);
	cout << "Removal of " << value << ":" << endl;
	for(it = container.begin(); it != container.end(); ++it)	//Goes through each of the elements of the container with an iterator
	{
		if(*it == value)	//If the value that the iterator points to is equal to the value that needs to be removed, remove it
		{
			container.erase(it,it+1);
			print(container);	//Print the new contents of the container
			cout << endl;
			return;
		}
	}
	cout << value << " was not found in the " << "container" << endl << endl;	//If no element was removed, tell the user that none was
	return;
}
