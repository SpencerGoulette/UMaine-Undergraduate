#ifndef TREE_H
#define TREE_H

#include <vector>
using namespace std;

class Tree
{
public:
	Tree()
	{

	}

	Tree(int root, vector<int>& parent, vector<int>& searchOrders)
	{
		this->root = root;
		this->parent = parent;
		this->searchOrders = searchOrders;
	}

	int getRoot() const
	{
		return root;
	}

	int getParent(int v) const
	{
		return parent[v];
	}

	vector<int> getSearchOrders() const
	{
		return searchOrders;
	}

	int getNumberOfVerticesFound() const
	{
		return searchOrders.size();
	}

	vector<int> getPath(int v) const
	{
		vector<int> path;

		do
		{
			path.push_back(v);
			v = parent[v];
		}
		while(v != -1);
		return path;
	}

	void printTree() const
	{
		cout << "Root is: " << root << endl;
		cout << "Edges: ";
		for(unsigned i = 0; i < searchOrders.size(); i++)
		{
			if(parent[searchOrders[i]] != -1)
			{
				cout << "(" << parent[searchOrders[i]] << ", " << searchOrders[i] << ") ";
			}
		}
		cout << endl;
	}
private:
	int root;
	vector<int> parent;
	vector<int> searchOrders;
};
#endif

