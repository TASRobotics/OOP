class Bullet {
  float speed = 12;
  PVector pos;
  PVector vel;
  PVector target;
  
  Bullet(float x, float y, float tx, float ty) {
    pos = new PVector(x, y);
    target = new PVector(tx, ty);
    vel = PVector.sub(target, pos);
    vel.setMag(speed);
  }
  
  void uad(){
    circle(pos.x, pos.y, 10);
    pos.add(vel);
    
  }
  
}
