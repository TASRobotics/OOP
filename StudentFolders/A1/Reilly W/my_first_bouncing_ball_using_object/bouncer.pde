class Bouncer {
  PVector pos;
  PVector v;
  int size = 50;
  
  Bouncer() {
    pos = new PVector(random(100, 700), random(100, 500));
    v = new PVector(random(-5, 5), random(-5, 5));
  }
  
  void move(){
   pos.add(v);

  if (pos.x>width-size/2 || pos.x<size/2) {
    v.x *= -1;
  }
  if (pos.y>height-size/2 || pos.y<size/2) {
    v.y *= -1;
  } 
  }
  void display(){
    fill(255);
    circle(pos.x, pos.y, size);
  }
}
