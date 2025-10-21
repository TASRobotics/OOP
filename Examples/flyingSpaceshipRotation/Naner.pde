class Naner {
  PVector position;
  PVector velocity;
  float angle;
  

  Naner(PVector sp, PVector sv, float sa) {
    position = new PVector(sp.x, sp.y);
    velocity = new PVector(sv.x, sv.y);
    angle = sa;
    PVector startvel = new PVector(0, -5);
    startvel.rotate(radians(angle));
    velocity.add(startvel);
    
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(radians(angle));
    image(naner, 0, 0);
    popMatrix();
  }

  void update() {
    position.add(velocity);
  }
  
}
