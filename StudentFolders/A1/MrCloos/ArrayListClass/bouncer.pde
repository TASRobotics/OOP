class Bouncer {
  PVector pos;
  PVector vel;
  float size;
  color c;

  Bouncer() {
    pos = new PVector(random(100, 700), random(100, 500));
    vel = new PVector(random(-3, 3), random(-3, 3));
    size = random(10, 40);
    c = color(255, 0, 0, 10);
  }

  void move() {
    pos.add(vel);
    if (pos.x < size/2 || pos.x > width - (size/2)) {
      vel.x = -vel.x;
      randomizeColor();
    }
    if (pos.y < size/2 || pos.y > height - (size/2)) {
      vel.y = -vel.y;
      randomizeColor();
    }
  }

  void display() {
    //stroke(200);
    noStroke();
    fill(c);
    circle(pos.x, pos.y, size);
  }

  void randomizeColor() {
    c = color(random(255), random(255), random(255), 10);
  }
}
