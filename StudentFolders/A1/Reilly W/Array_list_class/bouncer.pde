class Bouncer {
  PVector pos;
  PVector v;
  float size = 50;
  color c;

  Bouncer() {
    pos = new PVector(random(100, 700), random(100, 500));
    v = new PVector(random(-5, 5), random(-5, 5));
    size = random(10.0, 50.0);
    c = color(50);
  }

  void move() {
    pos.add(v);

    if (pos.x>width-size/2 || pos.x<size/2) {
      v.x *= -1;
      randomizeColor();
    }
    if (pos.y>height-size/2 || pos.y<size/2) {
      v.y *= -1;
      randomizeColor();
    }
  }
  void display() {
    //stroke(255);
    noStroke();
    fill(c);
    circle(pos.x, pos.y, size);
  }
  void randomizeColor(){
   c = color(random(255), random(255), random(255), random(10, 50));
  }
}
