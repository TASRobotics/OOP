class player {
  PVector pos;
  PVector vel;
  PVector grav;
  float x=700;
  float y=5;
  float w=50;
  float h=50;
  float jumpHeight;
  player() {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    grav = new PVector(0, 0.15);
    jumpHeight = 7;
    w=50;
    h=50;
  }
  void update() {
    vel.add(grav);
    pos.add(vel);
    if (pos.y + h > height) {
      vel.y = 0;
      pos.y = 750;
      canJump = true;
    }
  }
  void display() {
    rect(pos.x, pos.y, w, h);
  }
  void jump() {
    if (canJump == true) {
      vel = new PVector(0, -jumpHeight);
      canJump = false;
      println("jumped");
    }
  }
  boolean contactWith2(mPlatform m) {
    if (rectRect(pos.x, pos.y, w, h, m.pos.x, m.pos.y, m.w, m.h) == true) {
      return true;
    } else {
      return false;
    }
  }
}
