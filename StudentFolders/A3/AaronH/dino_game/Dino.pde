class Dino {
  PVector pos, vel, g;
  float w, h, jumpSpeed;
  boolean canJump;  

  Dino() {
    pos = new PVector(20, 500);
    vel = new PVector(0, 0);
    w = 70;
    h = 100;
    g = new PVector(0, 0.3);
    jumpSpeed = 12;
    canJump = true;  
  }

  void display() {
    fill(0);
    rect(pos.x, pos.y, w, h);
  }

  void update() {
    pos.add(vel);
    vel.add(g);

    
    if (pos.y > 500) {
      pos.y = 500;
      vel.y = 0;
      canJump = true;  
    }
  }

  void jump() {
    if (canJump) {      
      vel.y = -jumpSpeed;
      canJump = false;   
    }
  }
}
