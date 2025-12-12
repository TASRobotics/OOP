class Particle { //start class with capital (capital P for Particle)
  //first step cut and copy varaibles
  PVector pos;
  PVector vel;
  color c; //color
  float s; //size

  //constructer - cut and copy from og
  Particle() {
    pos = new PVector(random(100, 700), random(100, 500)); //random x between 100,700, random y between 100,500)
    vel = new PVector(random(-6, 6), random(6, -6));
    c = color(#D39191);
    s = 40;
  }

  //methods
  void display() {
    fill(c);
    circle(pos.x, pos.y, s);
  }

  void move() {
    pos.x += vel.x;
    pos.y += vel.y;
    if (pos.x < -s/2 || pos.x > width - (s/2) || pos.y < -s/2 || pos.y > height + (s/2)) {
      pos = new PVector(random(100, 700), random(100, 500));
      vel = new PVector(random(-6, 6), random(6, -6));
      s = 40;
      randomizeColor(); //when it hits the size, color is randomized)
    }
  }
  void setColor(color newcolor) { //takes in a new color called "newcolor"
    c = newcolor;
  }
  void randomizeColor() {
    c = color(random(255), random(255), random(255)); //new particle will have random color
  }
}
