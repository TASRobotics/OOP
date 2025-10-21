class Cactus {
  PVector pos, vel;
  float w, h;
  Cactus() {
    w = 50;
    h = 50;
    pos = new PVector(800, height - h);
   // println(h);
    vel = new PVector(-3, 0);
    
  }

  void display() {
    fill(255, 0, 0);
    rect(pos.x, pos.y, w, h);
  }

  void update() {
    pos.x += vel.x;
  }
}
