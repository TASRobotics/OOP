class Particle {
  PVector pos;
  PVector vel;
  color c;
  int s;

  Particle() {
    pos = new PVector(random(100, 700), random(100, 500));
    vel = new PVector(random(-6, 6), random(-6, 6));
    c = color(random(255), random(255), random(255), 30);
    s = 100;
  }

  void display() {
    fill(c);
    circle(pos.x, pos.y, s);
  }

  void move() {
    pos.x += vel.x;
    pos.y += vel.y;
    if (pos.x < s/2 || pos.x > width - (s/2) || pos.y < s/2 || pos.y > height - (s/2)) {
      pos = new PVector(random(100, 700), random(100, 500));
      vel = new PVector(random(-6, 6), random(-6, 6));
      s = 100;
      randomizeColor();
    }
  }
  void setColor (color newColor) {
    c = newColor;
  }
  
 void randomizeColor(){
   c = color(random(255), random(255), random(255), 30);
 }
}
