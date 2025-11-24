class Cactus {
  PVector pos, vel, g;
  float w, h, jumpSpeed;


  Cactus() {
    w = 50;
    h = 20;
    pos = new PVector(700, height-h); //setting starting position (across 20 pixels, y = 530)
    vel = new PVector(-5, 0);
  }

  void display() {
    fill(255);
    rect(pos.x, pos.y, w, h);
  }

  void update() {
    pos.add(vel);
    vel.y = 50;
    pos.y = height - h;
  }
}
