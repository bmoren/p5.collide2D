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

#### ~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~+~

#### collideRectRect()
###### collideRectRect(x, y, w, h, x2, y2, w2, h2)
Assumes rectMode(CORNER)
```javascript
fill(red);
rect(100,100,50,50);
fill(green);
rect(mouseX,mouseY,50,50);

var hit = collideRectRect(100, 100, 50, 50, mouseX, mouseY, 50, 50)

if(hit){
  print("collision between 2 rectangles!")
}
```

#### collideRectEllipse()
###### collideRectEllipse(x, y, w, h, cx, cy, cw, ch)
Assumes rectMode(CORNER) && ellipseMode(CENTER)
```javascript

fill(red);
rect(100,100,50,50);
fill(green);
ellipse(mouseX,mouseY,50,50);

var hit = collideRectEllipse(100, 100, 50, 50, mouseX, mouseY, 50, 50)
if(hit){
  print("collision between rectangle and ellipse!")

```

#### collideEllipseEllipse()
###### collideEllipseEllipse(x, y, w, h, cx, cy, cw, ch)
Assumes rectMode(CORNER) && ellipseMode(CENTER)
```javascript

fill(red);
ellipse(100,100,50,50);
fill(green);
ellipse(mouseX,mouseY,50,50);

var hit = collideRectEllipse(100, 100, 50, 50, mouseX, mouseY, 50, 50)
if(hit){
  print("collision between ellipse and ellipse!")

```