class Obstacles {
  float x, y, size, speed;

  Obstacles() {
    size = 40;
    x = random(0, width - size);
    y = -size;
    speed = random(3, 6);
  }

  void update() {
    y += speed;
  }

  void display() {
    fill(255, 0, 0);
    rect(x, y, size, size);
  }

  boolean hitsFrog() {
    return frogX < x + size &&
      frogX + frogW > x &&
      frogY < y + size &&
      frogY + frogH > y;
  }
}
