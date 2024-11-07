float x = 0;
float y = 600;
float cx = 0;
float cy = 0;

void setup(){
  //fullScreen();
  size(800, 600);
}

void draw(){
 //background(50); 
 fill(255);
 circle(0, 600, 50);
 fill(255, 0, 0);
 circle(x, y, 20);
 x += cx;
 y += cy;
}

void mousePressed(){
  x = 0;
  y = 600;
  float xdif = mouseX - 0;
  float ydif = mouseY - 600;
  float speed = dist(0, 600, mouseX, mouseY);
  float ratio = 10 / speed;

  cx = xdif * ratio;
  cy = ydif * ratio;
}
