#ifndef THREEDPOINT
#define THREEDPOINT
#include "MyPoint.h"
#include <math.h>

class ThreeDPoint: public MyPoint
{
	public:
		ThreeDPoint();					//Functions to create ThreeDPoints either (0,0,0) or (x,y,z)
		ThreeDPoint(double x, double y, double z);
		double getZ() const;				//Functions that gets Z
		double const distance(const MyPoint& pt2);	//Function that finds that distance between a ThreeDPoint and a MyPoint
	private:
		double zCoord;					//Z-Coordinate
};

ThreeDPoint::ThreeDPoint()					//Function that creates ThreeDPoint (0,0,0)
{
	xCoord = yCoord = zCoord = 0;
}

ThreeDPoint::ThreeDPoint(double x, double y, double z)		//Function that creates ThreeDPoint (x,y,z)
{
	xCoord = x;
	yCoord = y;
	zCoord = z;
}

double ThreeDPoint::getZ() const				//Function that gets the Z-Coordinate
{
	return zCoord;
}

double const ThreeDPoint::distance(const MyPoint& pt2)		//Function that finds the distance between a ThreeDPoint and a MyPoint
{
	return (double)sqrt(((pt2.getX() - xCoord)*(pt2.getX() - xCoord) + (pt2.getY() - yCoord)*(pt2.getY() - yCoord) + (zCoord)*(zCoord)));
}

#endif
