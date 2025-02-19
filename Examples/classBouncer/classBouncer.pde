Bouncer b;
Bouncer b2;
Bouncer b3;

void setup(){
  //fullScreen();
  size(800, 600);
  b = new Bouncer(100, 100, 10, 1);
  b2 = new Bouncer(700, 100, -10, 1);
  b3 = new Bouncer(400, 300, 0, 10);
}

void draw(){
 //background(50); 
 b.bounce();
 b2.bounce();
 b3.bounce();
}
