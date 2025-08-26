#ifndef MYPOINT_H
#define MYPOINT_H
#include <math.h>

class MyPoint
{
	public:
		MyPoint();						//Functions that creates either a MyPoint (0,0) and (x,y)
		MyPoint(double x, double y);				
		virtual double const distance(const MyPoint& pt2) = 0;	//Virtual function to find the distance
		double getX() const;					//Functions that get the X-Coordinate and Y-Coordinate
		double getY() const;
	protected:
		double xCoord;						//X-Coordinate and Y-Coordiante
		double yCoord;
};

MyPoint::MyPoint()							//Function that creates a MyPoint (0,0)
{
	xCoord = yCoord = 0;
}

MyPoint::MyPoint(double x, double y)					//Function that creates a MyPoint (x,y)
{
	xCoord = x;
	yCoord = y;
}

double MyPoint::getX() const						//Function that gets the X-Coordinate
{
	return xCoord;
}

double MyPoint::getY() const						//Function that gets the Y-Coordinate
{
	return yCoord;
}

#endif
