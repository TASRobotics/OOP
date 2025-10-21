class Dino {
  PVector dinopos;
  PVector gravity;
  float jumpStrength;
  PVector vel;
  float w;
  float h;
  boolean canJump;

  Dino() {
    dinopos = new PVector (100, 550);
    vel = new PVector (0, 0);
    gravity = new PVector (0, 0.67);
    jumpStrength = 15;
    w=25;
    h=50;
    canJump = true;
  }


  void update() {
    dinopos.add(vel);
    if (vel.y != 0 || dinopos.y < 550) {
      vel.add(gravity);
      canJump = false;
    }
    if (dinopos.y + h > height) {
      dinopos.y = 550;
      vel.y = 0;
      canJump = true;
    }
   
  }

  void display () {
    fill(0);
    rect(dinopos.x, dinopos.y, w, h);
  }

  void jump() {
    if (canJump == true) {
      vel = new PVector (0, -jumpStrength);
    }
  }

  boolean isTouching(Obstacle o) {
    if (rectRect(dinopos.x, dinopos.y, w, h, o.Opos.x, o.Opos.y, o.w, o.h )== true) {
      return true;
    } else {
      return false;
    }
  }
  
  
}
