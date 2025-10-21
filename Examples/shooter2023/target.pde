class Target {
  PVector pos;
  float d;
  float health = 100;
  boolean removeme = false;
  
  Target(float x, float y){
    pos = new PVector(x, y);
    d = map(health, 0, 100, 0, 75);
  }
  
  void display(){
    d = map(health, 0, 100, 0, 75);
    fill(255, 0, 0);
    circle(pos.x, pos.y, d);
  }
  
  
  
}
