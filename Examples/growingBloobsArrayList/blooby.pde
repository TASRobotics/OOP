class Blooby {
  float x, y, s, mx, mn, step;

  Blooby() {
    x = random(100, width-100);
    y = random(100, height-100);
    mn = random(1, 100);
    mx = random(mn + 10, mn + 200);
    s = random(mn + 10, mx - 10);
    step = random(-5, 5);
  }
  Blooby(float xx, float yy) {
    x = xx;
    y = yy;
    mn = random(1, 100);
    mx = random(mn + 10, mn + 200);
    s = random(mn + 10, mx - 10);
    step = random(-5, 5);
  }

  void show() {
    stroke(255, 60);
    fill(255, 30);
    ellipse(x, y, s, s);
  }

  void update() {
    s += step;
    if (s >= mx || s <= mn) {
      step = -step;
    }
  }
}
