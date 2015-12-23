### p5.collide

An lightweight 2d & 3d collision library for p5.js

#### collideRectRect()
###### collideRectRect(x, y, w, h, x2, y2, w2, h2)
Assumes rectMode(CORNER);
```javascript
fill(red);
rect(100,100,50,50);
fill(green);
rect(mouseX,mouseY,50,50);

var hit = collideRectRect(100, 50, 100, 50, mouseX, 50, mouseY, 50)

if(hit){
  print("collision between 2 rectangles!")
}
```