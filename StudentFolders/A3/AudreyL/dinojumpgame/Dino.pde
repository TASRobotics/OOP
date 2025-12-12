class Dino {
  PVector pos, vel, g;
  float w, h, jumpSpeed;
  boolean canJump;
  //int this_is_how_fast or ThisIsHow (2 ways)

  Dino() {
    w = 50;
    h = 77;
    pos = new PVector(20, height-h); //setting starting position (across 20 pixels, y = 530)
    vel = new PVector(0, 0);
    g = new PVector (0, 0.5);
    jumpSpeed = 12;
    canJump = true;
  }

  void display() {
    fill(0);
    rect(pos.x, pos.y, w, h);
  }

  void update() { //updates the position
    pos.add(vel); //x = x+cx; y = y +yx
    if (pos.y < height-h) { //if block position is hitting floor, dont continue with gravity - so block doesnt fall of) //if in the air
      vel.add(g);
      canJump = false; //can jump is false when in the air
    } else {
      vel.y = 0;
      pos.y = height - h;
      canJump = true; //true when on ground
    }
  }

  void jump() {
    if (canJump == true) { //if canJump is true (block is on ground) then you can jump., not true, (block is in the air), cant jump --> prevents double jumping //need curly brackets
      vel.y = -jumpSpeed;
    }
  }
}
