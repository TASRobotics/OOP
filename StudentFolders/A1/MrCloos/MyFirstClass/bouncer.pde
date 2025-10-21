class Bouncer {
  PVector pos;
  PVector vel;
  int size = 50;

  Bouncer() {
    pos = new PVector(random(100, 700), random(100, 500));
    vel = new PVector(random(-3, 3), random(-3, 3));
  }

  void move() {
    pos.add(vel);
    if (pos.x < size/2 || pos.x > width - (size/2)) {
      vel.x = -vel.x;
    }
    if (pos.y < size/2 || pos.y > height - (size/2)) {
      vel.y = -vel.y;
    }
  }
  
  void display(){
    fill(255);
    circle(pos.x, pos.y, size);
  }
}
