class Cactus {
    PVector pos;
  PVector vel;
  float w;
  float h;
  
  Cactus() {
   pos = new PVector(750, 550);
   vel = new PVector(-5, 0);
   w = 50;
   h = 50;
  }
  
  void display(){
    fill(255, 0, 0);
    rect(pos.x, pos.y, 50, 50);
  }
  void update(){
    pos.add(vel);
  }
}
