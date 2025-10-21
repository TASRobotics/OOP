Bouncer b;

void setup(){
  size(800, 600);
  b = new Bouncer();
}

void draw(){
  b.display();
  b.move();
  
}
