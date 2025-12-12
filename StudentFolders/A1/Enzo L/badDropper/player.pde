class player {
  PVector pos;
  PVector vel;
  PVector grav;
  float x=700;
  float y=5;
  float w=50;
  float h=50;
  float jumpHeight;
  boolean canJump = false;
  boolean gameover = false;
  boolean gamewon = false;
  boolean contactWithTop = false;
  boolean contactWithSides = false;
  player() {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    grav = new PVector(0, 0.15);
    jumpHeight = 4;
    w=50;
    h=50;
  }
  void update() {
    vel.add(grav);
    pos.add(vel);
    if (pos.y == height - h) {
      pos.y = height - h;
      vel.y = 0;
      gamewon = true;
    }
  }
  void display() {
    rect(pos.x, pos.y, w, h);
  }
  void jump() {
    if (canJump == true) {
      vel.y = -jumpHeight;
      canJump = false;
      println("jumped");
    }
  }
  boolean contactWithTop(mPlatform m) {
    boolean bottoml = pointRect(pos.x, pos.y + h, m.pos.x, m.pos.y, m.w, m.h);
    boolean bottomr = pointRect(pos.x + w, pos.y + h, m.pos.x, m.pos.y, m.w, m.h);
    return (bottoml || bottomr) && vel.y >= 0;
  }
  boolean contactWithSides(mPlatform m) {
    if(pos.y+h <= m.pos.y) return false;
    boolean leftside = pointRect( pos.x + w, pos.y, m.pos.x, m.pos.y, m.w, m.h) || pointRect(pos.x +w, pos.y+h, m.pos.x, m.pos.y, m.w, m.h);
    boolean rightside = pointRect(pos.x, pos.y, m.pos.x, m.pos.y, m.w, m.h) || pointRect(pos.x, pos.y+h, m.pos.x, m.pos.y, m.w, m.h);
    return leftside || rightside;
  }
}
