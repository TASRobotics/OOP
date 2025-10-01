class Dino {
  PVector pos, vel, g;
  float w, h, jumpSpeed;
  boolean canJump;
  
  Dino(){
    w = 70;
    h = 100;
    pos = new PVector(20, height-h);
    vel = new PVector(0, 0);
    g = new PVector(0, 0.5);
    jumpSpeed = 12;
    canJump = true;
  }
  
  void display(){
   fill(0);
   rect(pos.x, pos.y, w, h); 
  }
  
  void update(){
    pos.add(vel); // x = x + cx; y = y + cy;
    if(pos.y < 500){ //in the air
      vel.add(g);
      canJump = false;
    } else {  //on the ground
      vel.y = 0;
      pos.y = height-h;
      canJump = true;
    }
  }
  
  void jump(){
    if(canJump == true){
      vel.y = -jumpSpeed;
    }
  }
  
}
