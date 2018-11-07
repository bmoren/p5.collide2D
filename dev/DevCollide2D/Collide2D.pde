class Collide2D {
  boolean rectRect(float x, float y, float w, float h, float x2, float y2, float w2, float h2) {
    return x + w >= x2 && x <= x2 + w2 && y + h >= y2 && y <= y2 + h2;
  };
}
