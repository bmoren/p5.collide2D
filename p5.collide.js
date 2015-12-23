p5.prototype.collideRectRect = function (x, y, w, h, x2, y2, w2, h2) {
  //p5.prototype.squareSquare = function (x, w, y, h,  sX, sw, sY, sh) {
return w2 > x && h2 > y && w > x2 && h > y2;
};

p5.prototype.collideRectEllipse = function (x, y, w, h, cx, cy, cw, ch) {
//
};

p5.prototype.collideEllipseEllipse = function (x, y,w,h , x2, y2, w2, h2) {
//
};

p5.prototype.collidePointEllipse = function (x, y, cx, cy, radius) {
//
};

p5.prototype.collidePointRect = function (pointX, pointY, x, xW, y, yW) {
//
};

p5.prototype.collidePointPoint = function (x,y,z,x2,y2,z2) {
  //2d or 3d
  var distance = 1;
  var collide = false;

  if (arguments.length === 4) {
    // In the case of 2d: z means x2 and x2 means y
    distance = dist(x,y,z,x2);
  }else if (arguments.length === 6){
    distance = dist(x,y,z1,x2,y2,z2);
  }

  if( distance =< 0){
   collide = true;
  }else{
   collide = false;
  }
  return collide;
};

p5.prototype.collideBoxBox = function (pointX, pointY, x, xW, y, yW) {
//
};

p5.prototype.collideSphereSphere = function (pointX, pointY, x, xW, y, yW) {
//
};

p5.prototype.collideBoxSphere = function () {
//
};







