# p5.collide2D
![p5.collide](p5collide2d.png)

#### A 2d collision detection library for p5.js
p5.collide2D provides tools for calculating collision detection for 2D geometry with p5.js.

p5.collide2D contains some versions of, and references to, the functions in [Jeffrey Thompson's Collision Detection Book](http://www.jeffreythompson.org/collision-detection/). His code is [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/), so, this is too! I highly, highly, reccomend [reading his book](http://www.jeffreythompson.org/collision-detection/) to better understand all of the details involved in collision detection. Implementing this library into your code will be much easier and more efficent after reading it!

It's an incredible resource for this kind of work! – [http://www.jeffreythompson.org/collision-detection/](http://www.jeffreythompson.org/collision-detection/)

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a>

## Get Started!
p5.collide2D assumes the default p5.js rectMode(CORNER) and ellipseMode(CENTER).
All p5.collide2D functions return `true` if the specified geometry is colliding and `false` if they are not.

### Adding p5.collide2D to your project
[Download the latest release](https://github.com/bmoren/p5.collide2D/releases/)
[How to add a library to your p5.js sketch](https://p5js.org/libraries/)

#### CDN Links
+ https://cdn.jsdelivr.net/npm/p5.collide2d  
+ https://unpkg.com/p5.collide2d

#### How to use a CDN hosted version of the p5.collide2D library
To include the library via a CDN, add the library's CDN link using a `<script>` tag inside the `index.html` file within your project. 
```html
<!--
This enables the p5.js core library (automatically added within the p5.js web editor).
You'll need to include the core p5.js before using p5.collide2D.
-->
<script defer src="https://unpkg.com/p5"></script>

<!-- Includes the p5.collide2D addon library -->
<script defer src="https://unpkg.com/p5.collide2d"></script>
```
## Live Examples in the p5.js editor
  + [Collection of all examples of collision functions](https://editor.p5js.org/p52dcollide/collections/taUUdSGhj)
  + [Basic Usage](https://editor.p5js.org/p52dcollide/sketches/EKGWIHFYR)
  + [Button with a callback](https://editor.p5js.org/p52dcollide/sketches/BjDVckvWE)
  + [Object oriented collision](https://editor.p5js.org/p52dcollide/sketches/HOf1GOY4S)
  + [Randomly placing objects without touching](https://editor.p5js.org/p52dcollide/sketches/WYb8vT3Mh)
  + [Swords Game](https://editor.p5js.org/p52dcollide/sketches/DamkQQ2So)

## Using p5.collide2D with vector inputs
p5.collide2D supports vector version of all functions. Use the function names below with `Vector` added on to the name to utilize the vector version of the function. The function's arguments will then take in vectors instead of x/y values. Each of the examples below has a commented example to demonstrate vector usage. We will be updating the documentation and examples in the future to make this distinction more clear. This in no way affects the original functionality of the library.
```javascript
// Use vectors as input:
const p1 = createVector(100, 100);
const mouse = createVector(mouseX, mouseY);
const hit = collidePointPointVector(p1, mouse, 10);
```
## Documentation Table of Contents
##### Utility
  + [collideDebug()](#collidedebug)

##### 2D Collision Detection
  + [collidePointPoint()](#collidepointpoint)
  + [collidePointCircle()](#collidepointcircle)
  + [collidePointEllipse()](#collidepointellipse)
  + [collidePointRect()](#collidepointrect)
  + [collidePointLine()](#collidepointline)
  + [collidePointArc()](#collidepointarc)
  + [collideRectRect()](#colliderectrect)
  + [collideCircleCircle()](#collidecirclecircle)
  + [collideRectCircle()](#colliderectcircle)
  + [collideLineLine()](#collidelineline)
  + [collideLineCircle()](#collidelinecircle)
  + [collideLineRect()](#collidelinerect)
  + [collidePointPoly()](#collidepointpoly)
  + [collideCirclePoly()](#collidecirclepoly)
  + [collideRectPoly()](#colliderectpoly)
  + [collideLinePoly()](#collidelinepoly)
  + [collidePolyPoly()](#collidepolypoly)
  + [collidePointTriangle()](#collidepointtriangle)
  + [collide 2D primitive triangle](#collide-2d-primitive-triangle)

## p5.collide2D Examples & Documentation
#### collideDebug()
###### collideDebug(debugMode, size, color)
Enables collision debug mode. Draws an ellipse at the collision point between objects on screen where applicable and calculable.
+ collideDebug() is applicable to the following:
+ [collideLineCircle()](#collidelinecircle)
+ [collideLineLine()](#collidelineline)
+ [collideLineRect()](#collidelinerect)
+ [collideCirclePoly()](#collidecirclepoly)
+ [collideRectPoly()](#colliderectpoly)
+ [collideLinePoly()](#collidelinepoly)
+ [collidePolyPoly()](#collidepolypoly)
```javascript
function setup() {
  collideDebug(true);
}
```
#### collidePointPoint()
###### collidePointPoint(x, y, x2, y2, [buffer])
Point to point collision with an optional buffer zone.  

[Live example](https://editor.p5js.org/p52dcollide/sketches/iW0xNDDVm)
```javascript
var hit = false;

function draw() {
    background(255);
    circle(100, 100, 1);       // change to 10,10px size for buffer example
    circle(mouseX, mouseY, 1); // change to 10,10px size for buffer example

    // No buffer zone, most standard example:
    hit = collidePointPoint(100, 100, mouseX, mouseY);

    // Buffer of 10 px:
    // hit = collidePointPoint(100, 100, mouseX, mouseY, 10);

    // Use vectors as input:
    // const p1    = createVector(100, 100);
    // const mouse = createVector(mouseX, mouseY);
    // hit = collidePointPointVector(p1, mouse, 10);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collidePointCircle()
###### collidePointCircle(pointX, pointY, circleX, circleY, diameter)
Point to circle collision in 2D. Assumes ellipseMode(CENTER);  

[Live example](https://editor.p5js.org/p52dcollide/sketches/PLy8ksEoR)
```javascript
var hit = false;

function setup() {
    createCanvas(400, 400);
}

function draw() {
    background(255);
    circle(200, 200, 100);
    point(mouseX, mouseY);

    hit = collidePointCircle(mouseX, mouseY, 200, 200, 100);

    // Use vectors as input:
    // const mouse  = createVector(mouseX, mouseY);
    // const circle = createVector(200, 200);
    // const diam   = 100;
    // hit = collidePointCircleVector(mouse, circle, diam);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collidePointEllipse()
###### collidePointEllipse(pointX, pointY, ellipseX, ellipseY, ellipseWidth, ellipseHeight )
Point to ellipse collision.
It takes the point, the centre of the ellipse, the major and the minor axes (diameters).

![point ellipse collision](https://user-images.githubusercontent.com/13430702/47784680-98543d80-dd06-11e8-8814-47a37186263a.png)  

[Live example](https://editor.p5js.org/p52dcollide/sketches/nmVQQ2jEC)
```javascript
var hit = false;

function draw() {
    background(255);
    ellipse(200, 200, 50, 150);
    point(mouseX, mouseY);

    hit = collidePointEllipse(mouseX, mouseY, 200, 200, 50, 150);

    // Use vectors as input:
    // const mouse         = createVector(mouseX, mouseY);
    // const ellipse_start = createVector(200, 200);
    // const ellipse_size  = createVector(50, 150);
    // hit = collidePointEllipseVector(mouse, ellipse_start, ellipse_size);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collidePointRect()
###### collidePointRect(pointX, pointY, x, y, width, height)
Point to rect collision in 2D. Assumes rectMode(CORNER);  

[Live example](https://editor.p5js.org/p52dcollide/sketches/HtWDH-bHv)
```javascript
var hit = false;

function draw() {
    background(255);
    rect(200, 200, 100, 150);

    hit = collidePointRect(mouseX, mouseY, 200, 200, 100, 150);

    // Use vectors as input:
    // const mouse      = createVector(mouseX, mouseY);
    // const rect_start = createVector(200, 200);
    // const rect_size  = createVector(50, 150);
    // hit = collidePointRectVector(mouse, rect_start, rect_size);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collidePointLine()
###### collidePointLine(pointX, pointY, x, y, x2, y2, [buffer])
Point to line collision in 2D. Includes and optional buffer which expands the hit zone on the line (default buffer is 0.1).  

[Live example](https://editor.p5js.org/p52dcollide/sketches/IvJPamfGk)
```javascript
var hit = false;

function draw() {
    background(255);
    line(200, 300, 100, 150);
    point(mouseX, mouseY);

    // Collide point line using the optional buffer with a 0.5 value:
    hit = collidePointLine(mouseX, mouseY, 200, 300, 100, 150, .5);

    // Use vectors as input:
    // const mouse  = createVector(mouseX, mouseY);
    // const p1     = createVector(200, 300);
    // const p2     = createVector(100, 150);
    // const buffer = 0.5;
    // hit = collidePointLineVector(mouse, p1, p2, buffer);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collidePointArc()
###### collidePointArc(pointX, pointY, arcCenterX, arcCenterY, arcRadius, arcRotationAngle, arcAngle, [buffer])
Point to arc collision in 2D.

![point arc example image](https://cloud.githubusercontent.com/assets/9556971/25771905/4a299456-325e-11e7-9455-03bd1396c92d.png)  

[Live example](https://editor.p5js.org/p52dcollide/sketches/cx7CEAJsJ)
```javascript
const ARC_RADIUS = 100;
const ARC_ANGLE = Math.PI / 3;
const ROTATION_ANGLE = -Math.PI / 4;

var hit = false;

function draw() {
    background(220);
    push();

    // Translate to center of canvas:
    translate(width / 2, height / 2);

    // Rotate by some angle:
    rotate(ROTATION_ANGLE);

    fill(180, 220, 210);
    stroke(10);

    arc(0, 0, 2 * ARC_RADIUS, 2 * ARC_RADIUS, -ARC_ANGLE / 2, ARC_ANGLE / 2, PIE);
    pop();

    point(mouseX, mouseY);
    hit = collidePointArc(mouseX, mouseY, width / 2, height / 2, ARC_RADIUS, ROTATION_ANGLE, ARC_ANGLE);

    // Use vectors as input:
    // const mouse     = createVector(mouseX, mouseY);
    // const arcCenter = createVector(width / 2, height / 2);
    // const buffer    = 0.5 //optional buffer
    // hit = collidePointArcVector(mouse, arcCenter, ARC_RADIUS, ROTATION_ANGLE, ARC_ANGLE /*, buffer */);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collideCircleCircle()
###### collideCircleCircle(circleX, circleY, circleDiameter, circleX2, circleY2, circleDiameter2)
Circle to circle collision in 2D. Assumes ellipseMode(CENTER);  

[Live example](https://editor.p5js.org/p52dcollide/sketches/UjArR74hB)
```javascript
var hit = false;

function draw() {
    background(255);
    circle(200, 200, 100);
    circle(mouseX, mouseY, 150);

    hit = collideCircleCircle(mouseX, mouseY, 150, 200, 200, 100);

    // Use vectors as input:
    // const mouse  = createVector(mouseX, mouseY);
    // const circle = createVector(200, 200);
    // hit = collideCircleCircleVector(mouse, 150, circle, 100);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collideRectRect()
###### collideRectRect(x, y, width, height, x2, y2, width2, height2 )
Rect to rect collision in 2D. Assumes rectMode(CORNER);  

[Live example](https://editor.p5js.org/p52dcollide/sketches/by-l5Y_cf)
```javascript
var hit = false;

function draw() {
    background(255);
    rect(200, 200, 100, 150);
    rect(mouseX, mouseY, 50, 75);

    hit = collideRectRect(200, 200, 100, 150, mouseX, mouseY, 50, 75);

    // Use vectors as input:
    // const rect_start = createVector(200, 200);
    // const rect_size  = createVector(100, 150);
    // const mouse      = createVector(mouseX, mouseY);
    // const rect2_size = createVector(50, 75);
    // hit = collideRectRectVector(rect_start, rect_size, mouse, rect2_size);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collideRectCircle()
###### collideRectCircle(x1, y1, width1, height1, cx, cy, diameter)
Rect to circle collision in 2D. Assumes rectMode(CORNER) && ellipseMode(CENTER);  

[Live example](https://editor.p5js.org/p52dcollide/sketches/QDTBZgqVd)
```javascript
var hit = false;

function draw() {
    background(255);
    rect(200, 200, 100, 150);
    circle(mouseX, mouseY, 100);

    hit = collideRectCircle(200, 200, 100, 150, mouseX, mouseY, 100);

    // Use vectors as input:
    // const mouse      = createVector(mouseX, mouseY);
    // const rect_start = createVector(200, 200);
    // const rect_size  = createVector(100, 150);
    // const radius     = 100;
    // hit = collideRectCircleVector(rect_start, rect_size, mouse, radius);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collideLineLine()
###### collideLineLine(x1, y1, x2, y2, x3, y3, x4, y4, [calcIntersection])
Line to line collision in 2D. Takes an optional boolean parameter which calculates the intersection point.
If enabled it will return an object containing the x,y position of the collision intersection.
If no intersection occurs, it will return an object containing x,y values as false. Has a [debug mode](#collidedebug).  

[Live example](https://editor.p5js.org/p52dcollide/sketches/WGhIBE1Fe)
```javascript
// Basic example:
var hit = false;

function draw() {
    background(255);
    line(200, 300, 100, 150);
    line(mouseX, mouseY, 350, 50);

    hit = collideLineLine(200, 300, 100, 150, mouseX, mouseY, 350, 50);

    // Use vectors as input:
    // const p1    = createVector(200, 300);
    // const p2    = createVector(100, 150);
    // const mouse = createVector(mouseX, mouseY);
    // const p4    = createVector(350, 50);
    // hit = collideLineLineVector(p1, p2, mouse, p4);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```  

[Live example](https://editor.p5js.org/p52dcollide/sketches/zW0D99RYh)

```javascript
// Return an object containing the x,y position of the intersection
// using the optional calcIntersection boolean:
var hit = false;

function draw() {
    background(255);
    line(200, 300, 100, 150);
    line(mouseX, mouseY, 350, 50);

    hit = collideLineLine(200, 300, 100, 150, mouseX, mouseY, 350, 50, true);

    // Use vectors as input:
    // const p1    = createVector(200, 300);
    // const p2    = createVector(100, 150);
    // const mouse = createVector(mouseX, mouseY);
    // const p4    = createVector(350, 50);
    // hit = collideLineLineVector(p1, p2, mouse, p4, true);

    stroke(hit ? color('red') : 0);
    print('X-intersection:', hit.x);
    print('Y-intersection:', hit.y);
}
```
#### collideLineCircle()
###### collideLineCircle(x1,  y1,  x2,  y2,  cx,  cy,  diameter)
Point to circle collision in 2D. Has a [debug mode](#collidedebug).  

[Live example](https://editor.p5js.org/p52dcollide/sketches/1SpUuQpvH)
```javascript
var hit = false;

function draw() {
    background(255);
    line(200, 300, 100, 150);
    circle(mouseX, mouseY, 50);

    hit = collideLineCircle(200, 300, 100, 150, mouseX, mouseY, 50);

    // Use vectors as input:
    // const p1       = createVector(200, 300);
    // const p2       = createVector(100, 150);
    // const mouse    = createVector(mouseX, mouseY);
    // const diameter = 50;
    // hit = collideLineCircleVector(p1, p2, mouse, diameter);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collideLineRect()
###### collideLineRect(x1, y1, x2, y2, rx, ry, rw, rh, [calcIntersection])
Line to rectangle collision in 2d. Takes and optional boolean parameter which calculates the intersection points.
If enables it will return an object containing objects of the top,left,bottom,right X,Y intersection positions.
If no intersection occurs, it will return an object containing x,y values as false. Has a [debug mode](#collidedebug).  

[Live example](https://editor.p5js.org/p52dcollide/sketches/9SGFAmJWY)
```javascript
// Basic example:
var hit = false;

function draw() {
    background(255);
    rect(200, 300, 100, 150);
    line(mouseX, mouseY, 350, 50);

    hit = collideLineRect(mouseX, mouseY, 350, 50, 200, 300, 100, 150);

    // Use vectors as input:
    // const mouse      = createVector(mouseX, mouseY);
    // const p2         = createVector(350, 50);
    // const rect_start = createVector(200, 300);
    // const rect_size  = createVector(100, 150);
    // hit = collideLineRectVector(mouse, p2, rect_start, rect_size);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```  

[Live example](https://editor.p5js.org/p52dcollide/sketches/Lh8SaVtYt)
```javascript
// Return an object containing the x,y position of the bottom intersection of the rect
// using the optional calcIntersection boolean:
var hit = false;

function draw() {
    background(255);
    rect(200, 300, 100, 150);
    line(mouseX, mouseY, 350, 50);

    hit = collideLineRect(mouseX, mouseY, 350, 50, 200, 300, 100, 150, true);

    // Use vectors as input:
    // const mouse      = createVector(mouseX, mouseY);
    // const p2         = createVector(350, 50);
    // const rect_start = createVector(200, 300);
    // const rect_size 	= createVector(100, 150);
    // hit = collideLineRectVector(mouse, p2, rect_start, rect_size, true);

    // Because hit returns an object with .bottom, .top, .left and .right
    // we have to check if any has hit the rectangle:
    stroke(
      hit.bottom.x || hit.bottom.y ||
      hit.top.x    || hit.top.y ||
      hit.left.x   || hit.left.y ||
      hit.right.x  || hit.right.y ? color('red') : 0
    );

    // Returned object contains top,right,bottom,left objects each containing x,y values:
    print('bottomX:', hit.bottom.x);
    print('bottomY:', hit.bottom.y);
    print('topX:',    hit.top.x);
    print('topY:',    hit.top.y);
    print('leftX:',   hit.left.x);
    print('leftY:',   hit.left.y);
    print('rightX:',  hit.right.x);
    print('rightY:',  hit.right.y);
}
```
#### collidePointPoly()
###### collidePointPoly(pointX,pointY,vectorArray)
Point to poly collision in 2D.
Takes a point x,y and an array of [p5.Vector](http://p5js.org/reference/#/p5/createVector) points which contain the x,y positions of the polygon.
This function works with x-sided polygons, and "collapsed" polygons where a single polygon shape overlaps itself.  

[Live example](https://editor.p5js.org/p52dcollide/sketches/YOsnt24Jj)
```javascript
var hit = false;
const poly = []; // stores the vertices for our polygon.

function setup() {
    createCanvas(500, 500);

    // Set x,y positions as vecs:
    poly[0] = createVector(123, 231);
    poly[1] = createVector(10, 111);
    poly[2] = createVector(20, 23);
    poly[3] = createVector(390, 33);
}

function draw() {
    background(255);

    // Draw the polygon by iterating over the 4 created vectors{x, y} stored in poly[]:
    beginShape();
    for (const { x, y } of poly)  vertex(x, y);
    endShape(CLOSE);

    circle(mouseX, mouseY, 10); // put a small ellipse on our point.

    hit = collidePointPoly(mouseX, mouseY, poly); // 3rd param is an array of vertices.

    // Use vectors as input:
    // const mouse = createVector(mouseX, mouseY);
    // hit = collidePointPolyVector(mouse, poly);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collideCirclePoly()
###### collideCirclePoly(x,y,diameter,vectorArray, [interiorCollision])
Circle to poly collision in 2D. Takes a circle x,y,diameter and an array of [p5.Vector](http://p5js.org/reference/#/p5/createVector) points
which contain the x,y positions of the polygon. This function works with x-sided polygons, and "collapsed" polygons
where a single polygon shape overlaps itself. Takes an optional 5th 'true' boolean parameter which enables the collision detection
if the circle is wholly inside the polygon. The interior detection is off by default
to save evaluating all of the edges of the polygon a second time. Has a [debug mode](#collidedebug).  

[Live example](https://editor.p5js.org/p52dcollide/sketches/3mohbMIqL)
```javascript
var hit = false;
const poly = []; // stores the vertices for our polygon.

function setup() {
    createCanvas(500, 500);
    collideDebug(true); // enable debug mode

    // Set x,y positions as vecs:
    poly[0] = createVector(123, 231);
    poly[1] = createVector(10, 111);
    poly[2] = createVector(20, 23);
    poly[3] = createVector(390, 33);
}

function draw() {
    background(255);

    // Draw the polygon by iterating over the 4 created vectors{x, y} stored in poly[]:
    beginShape();
    for (const { x, y } of poly)  vertex(x, y);
    endShape(CLOSE);

    circle(mouseX, mouseY, 45);

    hit = collideCirclePoly(mouseX, mouseY, 45, poly);

    // Enable the hit detection if the circle is wholly inside the polygon:
    // hit = collideCirclePoly(mouseX, mouseY, 45, poly, true);

    // Use vectors as input:
    // const mouse = createVector(mouseX, mouseY);

    // hit = collideCirclePolyVector(mouse, 45, poly);
    // Or:
    // hit = collideCirclePolyVector(mouseX, mouseY, 45, poly, true);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collideRectPoly()
###### collideRectPoly(x,y,width,height,vectorArray, [interiorCollision])
Rect to poly collision in 2D. Takes a rect x,y,width,height and an array of [p5.Vector](http://p5js.org/reference/#/p5/createVector) points
which contain the x,y positions of the polygon. This function works with x-sided polygons,
and "collapsed" polygons where a single polygon shape overlaps itself. Takes an optional 6th 'true' boolean parameter
which enables the collision detection if the rect is wholly inside the polygon.
The interior detection is off by default to save evaluating all of the edges of the polygon a second time. Has a [debug mode](#collidedebug).  

[Live example](https://editor.p5js.org/p52dcollide/sketches/U0gM__qD2)
```javascript
var hit = false;
const poly = []; // stores the vertices for our polygon.

function setup() {
    createCanvas(800, 600);
    collideDebug(true); // enable debug mode

    // Set x,y positions as vecs:
    poly[0] = createVector(323, 431);
    poly[1] = createVector(210, 311);
    poly[2] = createVector(220, 223);
    poly[3] = createVector(590, 233);
}

function draw() {
    background(255);

    // Draw the polygon by iterating over the 4 created vectors{x, y} stored in poly[]:
    beginShape();
    for (const { x, y } of poly)  vertex(x, y);
    endShape(CLOSE);

    rect(mouseX, mouseY, 45, 100);

    hit = collideRectPoly(mouseX, mouseY, 45, 100, poly);

    // Enable the hit detection if the rectangle is wholly inside the polygon:
    // hit = collideRectPoly(mouseX, mouseY, 45, 100, poly, true);

    // Use vectors as input:
    // const mouse     = createVector(mouseX, mouseY);
    // const rect_size = createVector(45, 100);

    // hit = collideRectPolyVector(mouse, rect_size, poly);
    // Or:
    // hit = collideRectPolyVector(mouse, rect_size, poly, true);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collideLinePoly()
###### collideLinePoly(x1, y1, x2, y2, vertices)
Line to poly collision in 2D. Takes a line x,y,x2,y2 and an array of [p5.Vector](http://p5js.org/reference/#/p5/createVector) points
which contain the x,y positions of the polygon. This function works with x-sided polygons and "collapsed" polygons
where a single polygon shape overlaps itself. Has a [debug mode](#collidedebug).  

[Live example](https://editor.p5js.org/p52dcollide/sketches/PuSs-b-qh)
```javascript
var hit = false;
const poly = Array(16).fill(); // stores the vertices for our polygon.

function setup() {
    createCanvas(500, 400);
    collideDebug(true); // enable debug mode

    // Generate a 16-sided polygon:
    const angle = TAU / poly.length;
    for (var i = 0; i < poly.length; ++i) {
        const a = angle * i;
        const x = cos(a) * 100 + 300;
        const y = sin(a) * 100 + 200;
        poly[i] = createVector(x, y);
    }
}

function draw() {
    background(255);

    // Draw the polygon from the 16 created vectors{x, y} stored in poly[]:
    beginShape();
    for (const { x, y } of poly)  vertex(x, y);
    endShape(CLOSE);

    line(10, 10, mouseX, mouseY);

    hit = collideLinePoly(mouseX, mouseY, 45, 100, poly);

    // Use vectors as input:
    // const mouse = createVector(mouseX, mouseY);
    // const p2    = createVector(45, 100);
    // hit = collideLinePolyVector(mouse, p2, poly);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collidePolyPoly()
###### collidePolyPoly(polygon1, polygon2, [interiorCollision])
Polygon to polygon collision in 2D. Takes a 2 arrays of [p5.Vector](http://p5js.org/reference/#/p5/createVector) points
which contain the x,y positions of the polygons. This function works with x-sided polygons,
and "collapsed" polygons where a single polygon shape overlaps itself. Takes an optional 3rd 'true' boolean parameter
which enables the collision detection if the polygon is wholly inside the other polygon.
The interior detection is off by default to save evaluating all of the edges of the polygon a second time. Has a [debug mode](#collidedebug).  

[Live example](https://editor.p5js.org/p52dcollide/sketches/_D8hrOFvC)
```javascript
// Example adapted from Jeffrey Thompson:
var mouseDiff, hit = false;
const poly = Array(8).fill(); // stores the vertices for our polygon.
const randomPoly = []; // stores the vertices for our random-sided polygon.

function setup() {
    createCanvas(500, 400);
    collideDebug(true); // enable debug mode

    mouseDiff = createVector(); // temp vec for randomPoly[]

    // Generate an 8-sided uniform polygon:
    const angle = TAU / poly.length;
    for (var i = 0; i < poly.length; ++i) {
        const a = angle * i;
        const x = cos(a) * 100 + 300;
        const y = sin(a) * 100 + 200;
        poly[i] = createVector(x, y);
    }

    // Generate a random polygon:
    for (var a = 0; a < 360; a += random(15, 40)) {
        const t = radians(a);
        const x = cos(t) * random(30, 50);
        const y = sin(t) * random(30, 50);
        randomPoly.push(createVector(x, y));
    }
}

function draw() {
    background(255);

    // Draw the polygon by iterating over the 8 created vectors{x, y} stored in poly[]:
    beginShape();
    for (const { x, y } of poly)  vertex(x, y);
    endShape(CLOSE);

    // Update random polygon to mouse position:
    mouseDiff.set(mouseX, mouseY).sub(randomPoly[0]);
    for (const vec of randomPoly)  vec.add(mouseDiff);

    // Draw the random polygon from the created vectors{x, y} stored in randomPoly[]:
    beginShape();
    for (const { x, y } of randomPoly)  vertex(x, y);
    endShape(CLOSE);

    hit = collidePolyPoly(poly, randomPoly, true);

    // Vector version does the same thing, here for completeness:
    // hit = collidePolyPolyVector(poly, randomPoly, true);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collidePointTriangle()
###### collidePointTriangle(px, py, x1, y1, x2, y2, x3, y3)
Point to triangle collision in 2D. You could use [collidePointPoly()](#collidepointpoly) to do this as well, but this is more efficient.  

[live example](https://editor.p5js.org/p52dcollide/sketches/dEz6jlWHd)
```javascript
var hit = false;

function draw() {
    background(255);
    triangle(300, 200, 350, 300, 250, 300);
    circle(mouseX, mouseY, 10);

    hit = collidePointTriangle(mouseX, mouseY, 300, 200, 350, 300, 250, 300);

    // Use vectors as input:
    // const mouse = createVector(mouseX, mouseY);
    // const p1    = createVector(300, 200);
    // const p2    = createVector(350, 300);
    // const p3    = createVector(250, 300);
    // hit = collidePointTriangleVector(mouse, p1, p2, p3);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
#### collideCirclePoly()
###### collideCirclePoly(cx, cy, diameter, vertices, interior)
###### collide-2d-primitive-triangle
To collide any primitive shape into a triangle, use the corresponding primitive shape with a 3 sided-polygon as your triangle.
Note: you will have to define your triangle using [p5.Vector](http://p5js.org/reference/#/p5/createVector), see example below.
+ [collideCirclePoly()](#collidecirclepoly) circle to triangle collisions
+ [collideRectPoly()](#colliderectpoly) rect to triangle collisions
+ [collideLinePoly()](#collidelinepoly) line to triangle collisions
+ [collidePolyPoly()](#collidepolypoly) triangle to triangle collisions  

[Live example](https://editor.p5js.org/p52dcollide/sketches/eEhoVQNvP)
```javascript
var hit = false;
const triPoly = [];

function setup() {
    createCanvas(500, 400);
    collideDebug(true); // enable debug mode

    triPoly[0] = createVector(300, 200);
    triPoly[1] = createVector(350, 300);
    triPoly[2] = createVector(250, 300);
}

function draw() {
    background(255);

    // We could for loop over the triPoly[] to draw it with a begin/endShape, but this is simpler: :)
    triangle(300, 200, 350, 300, 250, 300);
    // Or:
    // triangle(triPoly[0].x, triPoly[0].y, triPoly[1].x, triPoly[1].y, triPoly[2].x, triPoly[2].y);

    circle(mouseX, mouseY, 45);

    hit = collideCirclePoly(mouseX, mouseY, 45, triPoly);

    // Use vectors as input:
    // const mouse    = createVector(mouseX, mouseY);
    // const diameter = 45;
    // hit = collideCirclePolyVector(mouse, diameter, triPoly, true);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
