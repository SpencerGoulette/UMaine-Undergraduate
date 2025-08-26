/*Spencer Goulette
 * HW 04
 * 10/05/17
 */

#include <iostream>
#include "ThreeDPoint.h"

using namespace std;

int main(int argc, char **argv)
{
	ThreeDPoint PointA(10,30,25.5);	//Creates two ThreeDPoints
	ThreeDPoint PointB;
	cout<<PointA.distance(PointB)<<endl; //Finds the distance between them
	cout<<"Spencer Goulette"<<endl;
}

