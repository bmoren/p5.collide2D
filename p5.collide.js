console.log("### p5.collide ###")

/*~++~+~+~++~+~++~++~+~+~ 2D ~+~+~++~+~++~+~+~+~+~+~+~+~+~+~+*/

p5.prototype.collideRectRect = function (x, y, w, h, x2, y2, w2, h2) {
  //2d
  //add in a thing to detect rectMode CENTER
  if (x + w >= x2 &&    // r1 right edge past r2 left
      x <= x2 + w2 &&    // r1 left edge past r2 right
      y + h >= y2 &&    // r1 top edge past r2 bottom
      y <= y2 + h2) {    // r1 bottom edge past r2 top
        return true;
  }
  return false;
};

p5.prototype.collideRectCircle = function (rx, ry, rw, rh, cx, cy, diameter) {
  //2d
  // temporary variables to set edges for testing
  var testX = cx;
  var testY = cy;

  // which edge is closest?
  if (cx < rx){         testX = rx       // left edge
  }else if (cx > rx+rw){ testX = rx+rw  }   // right edge

  if (cy < ry){         testY = ry       // top edge
  }else if (cy > ry+rh){ testY = ry+rh }   // bottom edge

  // // get distance from closest edges
  var distance = dist(cx,cy,testX,testY)

  // if the distance is less than the radius, collision!
  if (distance <= diameter/2) {
    return true;
  }
  return false;
};

p5.prototype.collideCircleCircle = function (x, y,d, x2, y2, d2) {
//2d
  if( dist(x,y,x2,y2) <= (d/2)+(d2/2) ){
    return true;
  }
  return false;
};

p5.prototype.collidePointCircle = function (x, y, cx, cy, d) {
//2d
if( dist(x,y,cx,cy) <= d/2 ){
  return true;
}
return false;
};

p5.prototype.collidePointRect = function (pointX, pointY, x, y, xW, yW) {
//2d
if (pointX >= x &&         // right of the left edge AND
    pointX <= x + xW &&    // left of the right edge AND
    pointY >= y &&         // below the top AND
    pointY <= y + yW) {    // above the bottom
        return true;
}
return false;
};



/*~++~+~+~++~+~++~++~+~+~ 3D ~+~+~++~+~++~+~+~+~+~+~+~+~+~+~+*/

p5.prototype.collidePointPoint = function (x,y,z,x2,y2,z2, buffer) {


  //2d or 3d

  if (arguments.length === 4 || arguments.length === 5) {
    if(y2 == undefined){
      y2 = 0;
    }
    // In the case of 2d: z means x2 , x2 means y2, y2 means buffer
    if(dist(x,y,z,x2) <= y2){
      return true;
    }
  }else if (arguments.length <= 6){
    if(buffer == undefined){
      buffer = 0;
    }
    if( dist(x,y,z,x2,y2,z2) <= buffer){
      return true;
    }
  }
  return false;
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







