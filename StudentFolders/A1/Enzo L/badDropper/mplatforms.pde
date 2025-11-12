class mPlatform {
  PVector pos;
  PVector vel;
  float w;
  float h;
  float x = random(50,750);
  float y = random(50,750);
  mPlatform() {
    w=150;
    h=55;
    pos = new PVector(x, y);
    vel = new PVector(-3, 0);
  }
  void display() {
    rect(pos.x, pos.y, w, h);
  }
  void update() {
    pos.add(vel);
    if(pos.x < 0){
      vel = new PVector(3,0);
    }
    if(pos.x > width-w){
      vel = new PVector(-3,0);
    }
  }
}
