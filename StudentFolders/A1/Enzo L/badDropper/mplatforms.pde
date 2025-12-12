class mPlatform {
  PVector pos;
  PVector vel;
  float w;
  float h;
  float x = random(width);
  float y = random(100,800);
  color cofplatforms;
  
  mPlatform() {
    w=150;
    h=55;
    pos = new PVector(x, y);
    vel = new PVector(-3, 0);
  }
  
  mPlatform(float _x, float _y){
    pos = new PVector(_x, _y);
    vel = new PVector(-3, 0);
    w = random(350,850);
    h = random(15,60);
    cofplatforms = color(random(255), random(255), random(255));
  }
  
  mPlatform(float _x, float _y, float _w, float _h, float xvel){
    pos = new PVector(_x, _y);
    vel = new PVector(xvel, 0);
    w = _w;
    h = _h;
  }
  void display() {
    fill(cofplatforms);
    rect(pos.x, pos.y, w, h);
  }
  
  void update() {
    pos.add(vel);
    if(pos.x < 0){
      vel = new PVector(random(4,10),0);
    }
    if(pos.x > width-w){
      vel = new PVector(random(-4,-10),0);
    }
  }
}
