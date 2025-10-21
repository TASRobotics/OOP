class Dino {
  PVector pos, vel, g;
  float w, h, jumpspeed;
  boolean canJump;

  Dino() {
    jumpspeed = 10;
    w = 70;
    h = 100;
    pos = new PVector(20, height - h);
    vel = new PVector(0, 0);
    g = new PVector (0, 0.5);
  }
  void display() {
    fill(50);
    rect(pos.x, pos.y, w, h);
  }
  void update() {
    pos.add(vel); //x = x + cx; y = y + cy;
    if (pos.y < 500) { //in the air
      vel.add(g);
      canJump = false;
    } else { // on the ground
      vel.y = 0;
      pos.y = height - h;
      canJump = true;
    }
  }

  void jump() {
    if (canJump == true) {
      vel.y = -jumpspeed;
    }
  }

  boolean check(Cactus checkme) {
    if (rectRect(pos.x, pos.y, w, h, checkme.pos.x, checkme.pos.y, checkme.w, checkme.h) == true) {
      return true;
    } else {
      return false;
    }
  }
}
