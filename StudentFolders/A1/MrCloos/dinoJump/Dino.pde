class Dino {
  PVector pos;
  PVector vel;
  PVector grav;
  float jumpStrength;
  float w;
  float h;
  boolean canJump;
  
  Dino() {
    pos = new PVector(50, 550);
    vel = new PVector(0,0);
    grav = new PVector(0, 0.5);
    jumpStrength = 10;
    w = 30;
    h = 50;
    canJump = true;
  }
  
  void update() {
    pos.add(vel);
    if(vel.y != 0 || pos.y < 550){ //add gravity if youre moving or youre above the ground
      vel.add(grav);
    }
    if(pos.y + h > height){
      vel.y = 0;
      pos.y = 550;
      canJump = true;
    }
  }

  void display() {
    fill(0);
    rect(pos.x, pos.y, w, h);
  }

  void jump() {
    if(canJump == true){
      vel = new PVector(0, -jumpStrength);
      canJump = false;
    }
  }
  
  boolean isTouching(Obs o) {
    return false;
  }
}
