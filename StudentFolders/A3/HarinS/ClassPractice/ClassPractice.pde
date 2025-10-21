Particle p;
Particle p2;
Particle p3;

void setup(){
  size(800, 600);
  background(40);
  p = new Particle();
  p2 = new Particle();
  p3 = new Particle();
  
}

void draw(){
  p.display();
  p.move();
  p2.display();
  p2.move();
  p3.display();
  p3.move();
  
}
