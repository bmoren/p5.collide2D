# p5.collide
#### A lightweight 2d & 3d collision library for p5.js

p5.collide contains some versions of, and references to, the functions in [Jeffrey Thompson's Collision Detection Book](http://www.jeffreythompson.org/collision-detection/)

[How to Add a library to your p5.js sketch](https://github.com/processing/p5.js/wiki/Libraries#adding-a-library-to-your-project)

p5.collide assumes the default p5.js rectMode(CORNER) and ellipseMode(CENTER)

##### License
p5.collide is MIT licensed

## Table of Contents
##### 2D Collision Detection
  + [collidePointPoint()](#collidePointPoint)
  + [collidePointEllipse()](#collidePointEllipse)
  + [collidePointRect()](#collidePointRect)
  + [collideRectRect()](#collideRectRect)
  + [collideEllipseEllipse()](#collideEllipseEllipse)
  + [collideRectEllipse()](#collideRectEllipse)

##### 3D Collision Detection
COMING SOON!
  + [collidePointPoint()](#collidePointPoint)
  + [collideBoxBox()](#collideBoxBox)
  + [collideBoxSphere()](#collideBoxSphere)
  + [collideSphereSphere()](#collideSphereSphere)


## p5.collide examples & documentation

#### collidePointPoint()
###### collidePointPoint((x, y, [z], x2, y2[2Dbuffer],[z2], [3Dbuffer])
Point to point collision in 2d or 3d with an optional buffer zone.

Standard Usage:
+ `collidePointPoint(x,y,x2,y2)` as the most basic collision between two points, no buffer
+ `collidePointPoint(x,y,x2,y2,2Dbuffer)` for collision between two points with a defined buffer
+ `collidePointPoint(x,y,z,x2,y2,z2)` for collision between two 3D points, no buffer
+ `collidePointPoint(x,y,z,x2,y2,z2,3Dbuffer)` for collision between two 3D points with a defined buffer


```javascript
//basic 2D example
var hit = false;
function draw() {
	background(255);
	ellipse(100,100,1,1); //change to 10,10px size for buffer example
	ellipse(mouseX,mouseY,1,1); //change to 10,10px size for buffer example

	//no buffer zone, most standard example
	hit = collidePointPoint(100,100,mouseX,mouseY)

	//buffer of 10 px
	//hit = collidePointPoint(100,100,mouseX,mouseY,10)

	print("colliding? " + hit);
}
```
```javascript
//basic 3D example
var hit = false;
function draw() {
	background(255);
}
```
#### collidePointCircle()
###### collidePointCircle(pointX, pointY, circleX, circleY, diameter)
point to circle collision in 2D. Assumes ellipseMode(CENTER);
```javascript
var hit = false;
function draw() {
	background(255);
	ellipse(200,200,100,100);
	point(mouseX,mouseY);

	hit = collidePointCircle(mouseX,mouseY,200,200,100)

	print("colliding? " + hit);

}
```
#### collidePointRect()
###### collidePointRect(pointX, pointY, x, y, width, height)
point to rect collision in 2D. Assumes rectMode(CORNER);
```javascript
var hit = false;
function draw() {
  background(255);
	rect(200,200,100,150);

	hit = collidePointRect(mouseX,mouseY,200,200,100,150);

	print("colliding? " + hit);

}
```

#### collideCircleCircle()
###### collideCircleCircle(circleX, circleY,circleDiameter, circleX2, circleY2, circleDiameter2)
circle to circle collision in 2D. Assumes ellipseMode(CENTER);

```javascript
var hit = false;
function draw() {
	background(255);
	ellipse(200,200,100,100);
	ellipse(mouseX,mouseY,150,150);

	hit = collideCircleCircle(mouseX,mouseY,150,200,200,100)

	print("colliding? " + hit);

}
```

#### collideRectRect()
###### collideRectRect(x, y, width, height, x2, y2, width2, height2 )
rect rect collision in 2D. Assumes rectMode(CORNER);

```javascript
var hit = false;
function draw() {
  background(255);
	rect(200,200,100,150);
	rect(mouseX,mouseY,50,75);

	hit = collideRectRect(200,200,100,150,mouseX,mouseY,50,75);

	print("colliding? " + hit);

}
```

#### collideRectCircle()
###### collideRectRect(x, y, width, height, x2, y2, width2, height2 )
rect circle collision in 2D. Assumes rectMode(CORNER) && ellipseMode(CENTER);

```javascript
var hit = false;
function draw() {
  background(255);
	rect(200,200,100,150);
	ellipse(mouseX,mouseY,100,100);

	hit = collideRectCircle(200,200,100,150,mouseX,mouseY,100);

	print("colliding? " + hit);
}
```


