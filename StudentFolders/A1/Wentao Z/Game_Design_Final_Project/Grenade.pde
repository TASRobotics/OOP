class Grenade {
  PVector pos;  
  PVector vel;  
  int size;
  boolean isDead;

  Grenade(float x, float y, PVector dir) {
    pos = new PVector(x, y);   
    vel = dir.copy();          
    size = 30;
    isDead = false;
  }

  void update() {
    pos.add(vel);               
  }

  void display() {
    fill(60, 100, 100);
    circle(pos.x, pos.y, size);
  }
}
