Collide2D c2d = new Collide2D();

void settings() {
  size(500, 500);
  pixelDensity(displayDensity());
}

void setup() {
  noLoop();
  println(c2d.rectRect(0, 0, 100, 100, 50, 50, 100, 100));
}

void draw() {
}
