console.log("### p5.collide ###")

p5.prototype.collideRectRect = function (x, y, w, h, x2, y2, w2, h2) {
  //2d
  return w2 > x && h2 > y && w > x2 && h > y2;
};

p5.prototype.collideRectEllipse = function (x, y, w, h, cx, cy, cw, ch) {
//2d
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

p5.prototype.collidePointRect = function (pointX, pointY, x, xW, y, yW) {
//
};

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







