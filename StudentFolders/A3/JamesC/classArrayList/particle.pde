class Particle {
  PVector pos;
  PVector vel;
  color c;
  float s;

  Particle() {
    pos = new PVector(random(100, 700), random(100, 500));
    vel = new PVector(random(-6, 6), random(-6, 6));
    c = color(#8669DE);
    s = 40;
  }

  void display() {
    noStroke();
    fill(c);
    circle(pos.x, pos.y, s);
  }

  void move() {
    pos.x += vel.x;
    pos.y += vel.y;

    if (pos.x < -s/2 || pos.x > width + (s/2) || pos.y < - s/2 || pos.y > height + (s/2)) {
      pos = new PVector(random(100, 700), random(100, 500));
      vel = new PVector(random(-6, 6), random(-6, 6));
      s = 40;
      randomizeColor();
    }
  }
  
  void setColor(color newcolor){
    c = newcolor;
  }
  
  void randomizeColor(){
    c = color(random(255), random(255), random(255), 20);  
  }
}
