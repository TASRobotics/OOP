class Projectile {
  PVector pos;
  PVector vel;
  float speed = 5;
  
  boolean removeme = false;
  
  Projectile(float x, float y, float tx, float ty){
    pos = new PVector(x, y);
    PVector target = new PVector(tx, ty);
    vel = PVector.sub(target, pos);
    vel.setMag(5);   
  }
  
  void uad(){
    pos.add(vel);
    fill(255);
    circle(pos.x, pos.y, 10);
    
    if(dist(400, 400, pos.x, pos.y) > 800){
      removeme = true;
    }
    
  }
  
}
