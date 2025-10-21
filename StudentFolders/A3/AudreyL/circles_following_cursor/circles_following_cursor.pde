float x = 400;
float y = 300;

void setup(){
  size(600, 600);
  rectMode(CENTER);
}

void draw(){
  x = mouseX;
  y = mouseY;
  //circle(x, y, 50);
  //square(x, y+25, 50);
  
  circle(x, y, 50);
  circle(x+20, y+20, 30);  
}
