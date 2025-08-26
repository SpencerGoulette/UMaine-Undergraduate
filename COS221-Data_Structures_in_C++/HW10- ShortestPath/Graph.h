#ifndef GRAPH_H
#define GRAPH_H

#include "Edge.h" // Defined in Listing 24.1
#include "Tree.h" // Defined in Listing 24.4
#include <algorithm>
#include <iostream>
#include <vector>
#include <queue> // For implementing BFS
#include <stdexcept>
#include <sstream> // For converting a number to a string

using namespace std;

template<typename V>
class Graph
{
	public:
		Graph();
		Graph(vector<V>& vertices, int edges[][2], int numberOfEdges);
		Graph(int numberOfVertices, int edges[][2], int numberOfEdges);
		Graph(vector<V>& vertices, vector<Edge>& edges);
		Graph(int numberOfVertices, vector<Edge>& edges); 
		int getSize() const;
		int getDegree(int v) const;
		V getVertex(int index) const;
		int getIndex(V v) const;
		vector<V> getVertices() const;
		vector<int> getNeighbors(int v) const;
		void printEdges() const;
		void printAdjacencyMatrix() const;
		void clear();
		virtual bool addVertex(V v);
		bool addEdge(int u, int v);																	
		Tree dfs(int v) const;
		Tree bfs(int v) const;
	protected:
		vector<V> vertices; // Store vertices
		vector<vector<Edge*>> neighbors; // Adjacency edge lists
		bool createEdge(Edge* e); // Add an edge																						
	private:
		void createAdjacencyLists(int numberOfVertices, int edges[][2], int numberOfEdges);
		void createAdjacencyLists(int numberOfVertices, vector<Edge>& edges);
		void dfs(int v, vector<int>& parent, vector<int>& searchOrders, vector<bool>& isVisited) const;
}; 

template<typename V>
Graph<V>::Graph()
{

}

template<typename V>
Graph<V>::Graph(vector<V>& vertices, int edges[][2], int numberOfEdges)
{
	for (unsigned i = 0; i < vertices.size(); i++)
		addVertex(vertices[i]);

	createAdjacencyLists(vertices.size(), edges, numberOfEdges);
}

template<typename V>
Graph<V>::Graph(int numberOfVertices, int edges[][2], int numberOfEdges)
{
	for (int i = 0; i < numberOfVertices; i++)
		addVertex(i); // vertices is {0, 1, 2, ..., n-1}

	createAdjacencyLists(numberOfVertices, edges, numberOfEdges);
}

template<typename V>
Graph<V>::Graph(vector<V>& vertices, vector<Edge>& edges)
{
	for (unsigned i = 0; i < vertices.size(); i++)
		addVertex(vertices[i]);

	createAdjacencyLists(vertices.size(), edges);
}

template<typename V>
Graph<V>::Graph(int numberOfVertices, vector<Edge>& edges)
{
	for (int i = 0; i < numberOfVertices; i++)
		addVertex(i); // vertices is {0, 1, 2, ..., n-1}

	createAdjacencyLists(numberOfVertices, edges);
}

template<typename V>
void Graph<V>::createAdjacencyLists(int numberOfVertices, int edges[][2], int numberOfEdges)
{
	for (int i = 0; i < numberOfEdges; i++)
	{
		int u = edges[i][0];			
		int v = edges[i][1];
		addEdge(u, v);
	}
}

template<typename V>
void Graph<V>::createAdjacencyLists(int numberOfVertices, vector<Edge>& edges)
{ 
	for (unsigned i = 0; i < edges.size(); i++)
	{
		int u = edges[i].u;
		int v = edges[i].v;
		addEdge(u, v);
	}
}

template<typename V>
int Graph<V>::getSize() const
{
	return vertices.size();
}

template<typename V>
int Graph<V>::getDegree(int v) const
{
	return neighbors[v].size();
}

template<typename V>
V Graph<V>::getVertex(int index) const
{
	return vertices[index];
}

template<typename V>
int Graph<V>::getIndex(V v) const
{
	for (unsigned i = 0; i < vertices.size(); i++)
	{
		if (vertices[i] == v)
			return i;
	}
	return -1; // If vertex is not in the graph
}

template<typename V>
vector<V> Graph<V>::getVertices() const
{
	return vertices;
}

template<typename V>
vector<int> Graph<V>::getNeighbors(int u) const
{
	vector<int> result;
	for (Edge* e: neighbors[u])
		result.push_back(e->v);
	return result;
}

template<typename V>
void Graph<V>::printEdges() const
{
	for (unsigned u = 0; u < neighbors.size(); u++)
	{
		cout << "Vertex " << getVertex(u) << ": "; 
		for (Edge* e: neighbors[u])
		{
			cout << "(" << getVertex(e->u) << ", " << getVertex(e->v) << ") ";
		}
		cout << endl;
	}
}

template<typename V>
void Graph<V>::printAdjacencyMatrix() const
{
	vector<vector<int>> adjacencyMatrix(getSize());
	for (int i = 0; i < getSize(); i++)
	{
		adjacencyMatrix[i] = vector<int>(getSize());
	}
	for (unsigned i = 0; i < neighbors.size(); i++)
	{
		for (Edge* e: neighbors[i])
		{
			adjacencyMatrix[i][e->v] = 1;
		}
	}
	for (unsigned i = 0; i < adjacencyMatrix.size(); i++)
	{
		for (unsigned j = 0; j < adjacencyMatrix[i].size(); j++)
		{
			cout << adjacencyMatrix[i][j] << " ";
		}
	cout << endl;
	}
}

template<typename V>
void Graph<V>::clear()
{
	vertices.clear();
	for (int i = 0; i < getSize(); i++)
		for (Edge* e: neighbors[i])
			delete e;
	neighbors.clear();
}

template<typename V>
bool Graph<V>::addVertex(V v)
{
	if (find(vertices.begin(), vertices.end(), v) == vertices.end())
	{
		vertices.push_back(v);
		neighbors.push_back(vector<Edge*>(0));
		return true;
	}
	else
	{
		return false;
	}
}

template<typename V>
bool Graph<V>::createEdge(Edge* e)
{
	if (e->u < 0 || e->u > getSize() - 1)
	{
		stringstream ss;
		ss << e->u;
		throw invalid_argument("No such edge: " + ss.str());
	}
	if (e->v < 0 || e->v > getSize() - 1)
	{
		stringstream ss;
		ss << e->v;
		throw invalid_argument("No such edge: " + ss.str());
	}
	vector<int> listOfNeighbors = getNeighbors(e->u);
	if (find(listOfNeighbors.begin(), listOfNeighbors.end(), e->v) == listOfNeighbors.end())
	{
		neighbors[e->u].push_back(e);
		return true;
	}
	else
	{
		return false;
	}
}

template<typename V>
bool Graph<V>::addEdge(int u, int v)
{
		return createEdge(new Edge(u, v));
}

template<typename V>
Tree Graph<V>::dfs(int u) const
{
	vector<int> searchOrders;
	vector<int> parent(vertices.size());
	for (unsigned i = 0; i < vertices.size(); i++)
		parent[i] = -1; // Initialize parent[i] to -1
	vector<bool> isVisited(vertices.size());
	for (unsigned i = 0; i < vertices.size(); i++)
	{
		isVisited[i] = false;
	}					
	dfs(u, parent, searchOrders, isVisited);
	return Tree(u, parent, searchOrders);
}

template<typename V>
void Graph<V>::dfs(int u, vector<int>& parent, vector<int>& searchOrders, vector<bool>& isVisited) const
{
	searchOrders.push_back(u);
	isVisited[u] = true; // Vertex v visited
	for (Edge* e: neighbors[u])
	{
		if (!isVisited[e->v])
		{
			parent[e->v] = u; // The parent of vertex i is v
			dfs(e->v, parent, searchOrders, isVisited); // Recursive search
		}
	}
}

template<typename V>
Tree Graph<V>::bfs(int v) const
{
	vector<int> searchOrders;
	vector<int> parent(vertices.size());
	for (int i = 0; i < getSize(); i++)
		parent[i] = -1; // Initialize parent[i] to -1
	queue<int> queue; // Stores vertices to be visited
	vector<bool> isVisited(getSize());
	queue.push(v); // Enqueue v
	isVisited[v] = true; // Mark it visited
	while (!queue.empty())
	{
		int u = queue.front(); // Get from the front of the queue
		queue.pop(); // remove the front element
		searchOrders.push_back(u); // u searched
		for (Edge* e: neighbors[u])
		{
			int w = e->v;	
			if (!isVisited[w])
			{
				queue.push(w); // Enqueue w
				parent[w] = u; // The parent of w is u
				isVisited[w] = true; // Mark it visited
			}
		}
	}
	return Tree(v, parent, searchOrders);
}

#endif
