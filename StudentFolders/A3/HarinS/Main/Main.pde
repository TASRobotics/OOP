Button b1;
Button b2;
Button b3;
Button b4;
int x = 400;
int y = 300;

void setup() {
  size(800, 600);
  b1 = new Button(600, 400, 50, "UP");
  b2 = new Button(600, 500, 50, "DOWN");
  b3 = new Button(550, 450, 50, "LEFT");
  b4 = new Button(650, 450, 50, "RIGHT");
}

void draw() {
  background(50);
  b1.display();
  b2.display();
  b3.display();
  b4.display();
  fill(255);
  circle(x, y, 100);
}

void mousePressed() {
  if(b1.check() == true){
    y -= 10;
  }
  if(b2.check() == true){
    y += 10;
  }
  if(b3.check() == true){
    x -= 10;
  }
  if(b4.check() == true){
    x += 10;
  }
}
