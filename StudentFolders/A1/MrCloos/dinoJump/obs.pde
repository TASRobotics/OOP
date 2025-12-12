class Obs {
  PVector pos;
  PVector vel;
  float w;
  float h;
  
  Obs() {
   pos = new PVector(750, 550);
   vel = new PVector(-5, 0);
   w = 50;
   h = 50;
  }
  
  void display(){
    fill(255, 0, 0);
    rect(pos.x, pos.y, 50, 50);
  }
  void move(){
    pos.add(vel);
  }
  
}
