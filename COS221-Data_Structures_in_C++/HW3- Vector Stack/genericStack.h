#include <vector>

using namespace std;

template<typename T>
class Stack 
{
public:		//Public functions
	Stack(); 
	bool empty() const;
	T peek() const;
	void push(T value);
	void pop();
	int getSize() const;

private:	//Private functions
	vector<T> elements;
	int size;
};

template<typename T>	//Creating the stack
Stack<T>::Stack() {	
	elements.resize(0);
}

template<typename T>	//Creating the empty() function
bool Stack<T>::empty() const {
	return elements.size() == 0;
}

template<typename T>	//Creating the peek() function
T Stack<T>::peek() const {
	return elements.at(elements.size() - 1);
}

template<typename T>	//Creating the push() function
void Stack<T>::push(T value) {
	elements.push_back(value);
}

template<typename T>	//Creating the pop() function
void Stack<T>::pop() {	
	elements.pop_back();
}

template<typename T>	//Creating the getSize() function
int Stack<T>::getSize() const {
	return elements.size();
}
