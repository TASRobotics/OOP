class Drop {
  float x;
  float y;

  Drop() {
    x = random(width);
    y = random(height);
  }

  void drawAndMove() {
    circle(x, y, 30);
    y += 4;
    if (y > height) {
      y = 0;
    }
  }
}
