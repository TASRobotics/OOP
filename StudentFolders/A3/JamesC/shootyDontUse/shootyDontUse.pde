float x = 400;
float y = 550;
boolean moving = false;


void setup() {
  //fullScreen();
  size(800, 600);
}

void draw() {
  background(50);
  circle(x, y, 30);

  if (moving == true) {
    y = y - 5;
  }
  if(y < -15){
    moving = false;
    x = random(0, 800);
    y = 550;
  }
}

void keyPressed() {
  if(moving == false){
    moving = true;
  }
}
