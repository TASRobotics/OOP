float x;
float y;
float speed = 0;

void setup() {
  size(800, 600);
  x = random(width);
  y = 550;
}

void draw() {
  background(50);
  circle(x, y, 20);
  y = y - speed;
  
 
  if (y < 0) {
    y = 550;
    x = random(width);
    speed = 0;  
  }
}
        
void keyPressed() {
  if (key == ' ') {
    speed = 5;  
  }
}
