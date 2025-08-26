#include <iostream>
#include <string>
#include <vector>
#include "Graph.h"

using namespace std;

int main()
{
	string vertices[] = {"0", "1", "2", "3", "4", "5"};

	int edges[][2] = {
		{0, 1}, {0, 2},
		{1, 0}, {1, 3},
		{2, 0}, {2, 3}, {2, 4},
		{3, 1}, {3, 2}, {3, 4}, {3, 5},
		{4, 2}, {4, 3}, {4, 5},
		{5, 3}, {5, 4}
	};
	const int NUMBER_OF_EDGES = 16;
	const int NUMBER_OF_VERTICES = 6;
	int source, destination;
	vector<int> path;

	cout << "Enter two vertices (integer indexes): ";
	cin >> destination >> source;
	
	vector<string> vectorOfVertices(NUMBER_OF_VERTICES);
	copy(vertices, vertices + NUMBER_OF_VERTICES, vectorOfVertices.begin());

	Graph<string> graph(vectorOfVertices, edges, NUMBER_OF_EDGES);
	Tree bfs = graph.bfs(source);
	path = bfs.getPath(destination);

	cout << "The number of vertices is " << bfs.getNumberOfVerticesFound() << endl;

	graph.printEdges();

	cout << "The path is ";

	for(int e : path)
		cout << vertices[e] << " ";
	cout << endl;

	/*vector<int> searchOrders = dfs.getSearchOrders();
	cout << "The number of vertices is " << dfs.getNumberOfVerticesFound() << " ";
	int size = searchOrders.size();
	for(unsigned i = 0; i < size; i++)
	{
		cout << graph.getVertex(searchOrders[i]) << ": ";
	}
	cout << endl << endl;*/
}
