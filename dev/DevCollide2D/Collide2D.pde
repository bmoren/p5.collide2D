class Collide2D {
  float epsilon = 0.1;

  boolean rectRect(float x, float y, float w, float h, float x2, float y2, float w2, float h2) {
    return x + w >= x2 && x <= x2 + w2 && y + h >= y2 && y <= y2 + h2;
  };

  boolean rectCircle(float rx, float ry, float rw, float rh, float cx, float cy, float diameter) {
    // temporary variables to set edges for testing
    float testX = cx;
    float testY = cy;

    // which edge is closest?
    if (cx < rx) {         
      testX = rx;       // left edge
    } else if (cx > rx + rw) { 
      testX = rx + rw;
    }   // right edge

    if (cy < ry) {         
      testY = ry;       // top edge
    } else if (cy > ry + rh) { 
      testY = ry + rh;
    }   // bottom edge

    // Get distance from closest edges
    float distance = dist(cx, cy, testX, testY);

    // If the distance is less than the radius, collision!
    return distance <= diameter / 2;
  };

  boolean circleCircle(float x, float y, float d, float x2, float y2, float d2) {
    return dist(x, y, x2, y2) <= d / 2 + d2 / 2;
  };

  boolean pointCircle(float x, float y, float cx, float cy, float d) {
    return dist(x, y, cx, cy) <= d / 2;
  };

  boolean pointRect(float pointX, float pointY, float x, float y, float xW, float yW) {
    return pointX >= x && pointX <= x + xW && pointY >= y && pointY <= y + yW;
  };

  boolean pointLine(float px, float py, float x1, float y1, float x2, float y2, float epsilon) {
    // get distance from the point to the two ends of the line
    float d1 = dist(px, py, x1, y1);
    float d2 = dist(px, py, x2, y2);

    // get the length of the line
    float lineLen = dist(x1, y1, x2, y2);

    // if the two distances are equal to the line's length, the point is on the line!
    // note we use the epsilon here to give a range, rather than one #
    return d1 + d2 >= lineLen - epsilon && d1 + d2 <= lineLen + epsilon;
  }

  boolean pointLine(float px, float py, float x1, float y1, float x2, float y2) {
    return pointLine(px, py, x1, y1, x2, y2, epsilon);
  }

  boolean lineCircle(float x1, float y1, float x2, float y2, float cx, float cy, float diameter) {
    // is either end INSIDE the circle?
    // if so, return true immediately
    boolean inside1 = pointCircle(x1, y1, cx, cy, diameter);
    boolean inside2 = pointCircle(x2, y2, cx, cy, diameter);
    if (inside1 || inside2) return true;

    // get length of the line
    float distX = x1 - x2;
    float distY = y1 - y2;
    float len = sqrt( (distX*distX) + (distY*distY) );

    // get dot product of the line and circle
    float dot = ( ((cx-x1)*(x2-x1)) + ((cy-y1)*(y2-y1)) ) / pow(len, 2);

    // find the closest point on the line
    float closestX = x1 + (dot * (x2-x1));
    float closestY = y1 + (dot * (y2-y1));

    // is this point actually on the line segment?
    // if so keep going, but if not, return false
    boolean onSegment = pointLine(closestX, closestY, x1, y1, x2, y2);
    if (!onSegment) return false;

    // draw a debug circle at the closest point on the line
    //if (this._collideDebug) {
    //  this.ellipse(closestX, closestY, 10, 10);
    //}

    // get distance to closest point
    distX = closestX - cx;
    distY = closestY - cy;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    if (distance <= diameter/2) {
      return true;
    }
    return false;
  }

  boolean lineLine(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    // calculate the distance to intersection point
    float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
    float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

    // if uA and uB are between 0-1, lines are colliding
    if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
      return true;
    }
    return false;
  }

  PVector getLineLine(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    // calculate the distance to intersection point
    float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
    float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

    // if uA and uB are between 0-1, lines are colliding
    if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
      return new PVector(x1 + (uA * (x2-x1)), y1 + (uA * (y2-y1)));
    }
    return null;
  }

  // TODO: Do a return intersection point(s) version of this
  boolean lineRect(float x1, float y1, float x2, float y2, float rx, float ry, float rw, float rh) {
    // check if the line has hit any of the rectangle's sides. uses the collideLineLine function above
    boolean left = lineLine(x1, y1, x2, y2, rx, ry, rx, ry+rh);
    boolean right = lineLine(x1, y1, x2, y2, rx+rw, ry, rx+rw, ry+rh);
    boolean top = lineLine(x1, y1, x2, y2, rx, ry, rx+rw, ry);
    boolean bottom = lineLine(x1, y1, x2, y2, rx, ry+rh, rx+rw, ry+rh);

    // if ANY of the above are true, the line has hit the rectangle
    if (left || right || top || bottom) {
      return true;
    }
    return false;
  }

  //boolean PointPoly(px, py, vertices) {
  //  var collision = false;

  //  // go through each of the vertices, plus the next vertex in the list
  //  var next = 0;
  //  for (var current=0; current<vertices.length; current++) {

  //    // get next vertex in list if we've hit the end, wrap around to 0
  //    next = current+1;
  //    if (next == vertices.length) next = 0;

  //    // get the PVectors at our current position this makes our if statement a little cleaner
  //    var vc = vertices[current];    // c for "current"
  //    var vn = vertices[next];       // n for "next"

  //    // compare position, flip 'collision' variable back and forth
  //    if (((vc.y > py && vn.y < py) || (vc.y < py && vn.y > py)) &&
  //      (px < (vn.x-vc.x)*(py-vc.y) / (vn.y-vc.y)+vc.x)) {
  //      collision = !collision;
  //    }
  //  }
  //  return collision;
  //}

  //// POLYGON/CIRCLE
  //boolean CirclePoly(cx, cy, diameter, vertices, interior) {

  //  if (interior == undefined) {
  //    interior = false;
  //  }

  //  // go through each of the vertices, plus the next vertex in the list
  //  var next = 0;
  //  for (var current=0; current<vertices.length; current++) {

  //    // get next vertex in list if we've hit the end, wrap around to 0
  //    next = current+1;
  //    if (next == vertices.length) next = 0;

  //    // get the PVectors at our current position this makes our if statement a little cleaner
  //    var vc = vertices[current];    // c for "current"
  //    var vn = vertices[next];       // n for "next"

  //    // check for collision between the circle and a line formed between the two vertices
  //    var collision = this.collideLineCircle(vc.x, vc.y, vn.x, vn.y, cx, cy, diameter);
  //    if (collision) return true;
  //  }

  //  // test if the center of the circle is inside the polygon
  //  if (interior == true) {
  //    var centerInside = this.collidePointPoly(cx, cy, vertices);
  //    if (centerInside) return true;
  //  }

  //  // otherwise, after all that, return false
  //  return false;
  //}

  //boolean RectPoly( rx, ry, rw, rh, vertices, interior) {
  //  if (interior == undefined) {
  //    interior = false;
  //  }

  //  // go through each of the vertices, plus the next vertex in the list
  //  var next = 0;
  //  for (var current=0; current<vertices.length; current++) {

  //    // get next vertex in list if we've hit the end, wrap around to 0
  //    next = current+1;
  //    if (next == vertices.length) next = 0;

  //    // get the PVectors at our current position this makes our if statement a little cleaner
  //    var vc = vertices[current];    // c for "current"
  //    var vn = vertices[next];       // n for "next"

  //    // check against all four sides of the rectangle
  //    var collision = this.collideLineRect(vc.x, vc.y, vn.x, vn.y, rx, ry, rw, rh);
  //    if (collision) return true;

  //    // optional: test if the rectangle is INSIDE the polygon note that this iterates all sides of the polygon again, so only use this if you need to
  //    if (interior == true) {
  //      var inside = this.collidePointPoly(rx, ry, vertices);
  //      if (inside) return true;
  //    }
  //  }

  //  return false;
  //}

  //boolean LinePoly(x1, y1, x2, y2, vertices) {

  //  // go through each of the vertices, plus the next vertex in the list
  //  var next = 0;
  //  for (var current=0; current<vertices.length; current++) {

  //    // get next vertex in list if we've hit the end, wrap around to 0
  //    next = current+1;
  //    if (next == vertices.length) next = 0;

  //    // get the PVectors at our current position extract X/Y coordinates from each
  //    var x3 = vertices[current].x;
  //    var y3 = vertices[current].y;
  //    var x4 = vertices[next].x;
  //    var y4 = vertices[next].y;

  //    // do a Line/Line comparison if true, return 'true' immediately and stop testing (faster)
  //    var hit = this.collideLineLine(x1, y1, x2, y2, x3, y3, x4, y4);
  //    if (hit) {
  //      return true;
  //    }
  //  }
  //  // never got a hit
  //  return false;
  //}

  //boolean PolyPoly(p1, p2, interior) {
  //  if (interior == undefined) {
  //    interior = false;
  //  }

  //  // go through each of the vertices, plus the next vertex in the list
  //  var next = 0;
  //  for (var current=0; current<p1.length; current++) {

  //    // get next vertex in list, if we've hit the end, wrap around to 0
  //    next = current+1;
  //    if (next == p1.length) next = 0;

  //    // get the PVectors at our current position this makes our if statement a little cleaner
  //    var vc = p1[current];    // c for "current"
  //    var vn = p1[next];       // n for "next"

  //    //use these two points (a line) to compare to the other polygon's vertices using polyLine()
  //    var collision = this.collideLinePoly(vc.x, vc.y, vn.x, vn.y, p2);
  //    if (collision) return true;

  //    //check if the 2nd polygon is INSIDE the first
  //    if (interior == true) {
  //      collision = this.collidePointPoly(p2[0].x, p2[0].y, p1);
  //      if (collision) return true;
  //    }
  //  }

  //  return false;
  //}

  boolean pointTriangle(float px, float py, float x1, float y1, float x2, float y2, float x3, float y3) {
    // get the area of the triangle
    float areaOrig = abs( (x2-x1)*(y3-y1) - (x3-x1)*(y2-y1) );

    // get the area of 3 triangles made between the point and the corners of the triangle
    float area1 = abs( (x1-px)*(y2-py) - (x2-px)*(y1-py) );
    float area2 = abs( (x2-px)*(y3-py) - (x3-px)*(y2-py) );
    float area3 = abs( (x3-px)*(y1-py) - (x1-px)*(y3-py) );

    // if the sum of the three areas equals the original, we're inside the triangle!
    if (area1 + area2 + area3 == areaOrig) {
      return true;
    }
    return false;
  }

  boolean pointPoint(float x, float y, float x2, float y2, float epsilon) {
    if (dist(x, y, x2, y2) <= epsilon) {
      return true;
    }
    return false;
  };

  boolean pointPoint(float x, float y, float x2, float y2) {
    return pointPoint(x, y, x2, y2, epsilon);
  }

  //boolean PointArc(px, py, ax, ay, arcRadius, arcHeading, arcAngle, epsilon) {

  //  if (epsilon == undefined) {
  //    epsilon = 0;
  //  }
  //  // point
  //  var point = this.createVector(px, py);
  //  // arc center point
  //  var arcPos = this.createVector(ax, ay);
  //  // arc radius vector
  //  var radius = this.createVector(arcRadius, 0).rotate(arcHeading);

  //  var pointToArc = point.copy().sub(arcPos);

  //  if (point.dist(arcPos) <= (arcRadius + epsilon)) {
  //    var dot = radius.dot(pointToArc);
  //    var angle = radius.angleBetween(pointToArc);
  //    if (dot > 0 && angle <= arcAngle / 2 && angle >= -arcAngle / 2) {
  //      return true;
  //    }
  //  }
  //  return false;
  //}
}
