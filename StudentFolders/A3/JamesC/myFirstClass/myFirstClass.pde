Particle p;
Particle p2;

void setup() {
  size(800, 600);
  background(40);
  p = new Particle();
  //p.randomizeColor();
  p2 = new Particle();
  //p2.randomizeColor();
  //p2.setColor(#F27DF0);
}

void draw() {
  p.display();
  p.move();
  p2.display();
  p2.move();
  
  
}
