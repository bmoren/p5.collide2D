# p5.collide
#### A lightweight 2d & 3d collision library for p5.js
+ collideRectRect()
+ collideRectEllipse()
+ collideEllipseEllipse()
+ collidePointEllipse()
+ collidePointRect()
+ collidePointPoint()
+ collideBoxBox()
+ collideBoxSphere()
+ collideSphereSphere()

#### License
p5.collide is MIT licensed

p5.collide contains some versions of, and references to, the functions in [Jeffrey Thompson's Collision Detection Book](http://www.jeffreythompson.org/collision-detection/)

#### ~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~

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

	fill("red");
	ellipse(100,100,1,1); //change to 10,10px size for buffer example
	fill("green");
	ellipse(mouseX,mouseY,1,1); //change to 10,10px size for buffer example

	//no buffer zone, most standard example
	hit = collidePointPoint(100,100,mouseX,mouseY)

	//buffer of 10 px
	//hit = collidePointPoint(100,100,mouseX,mouseY,10)

	print("points colliding? " + hit);
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
###### collidePointCircle(circleX, circleY,circleDiameter, circleX2, circleY2, circleDiameter2)
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


