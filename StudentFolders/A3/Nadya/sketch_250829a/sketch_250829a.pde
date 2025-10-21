int numCircles = 3;
int numTriangles = 3;
float x = 600;
float y = 100;
float yspeed = 3;

void setup(){
  size(800, 600);
  noStroke();
}

void draw(){
  background(50);
  triangle(x-23, y-10, x+23, y-10, x, y-40);
  circle(x, y, 50);
  
  y += yspeed;
  if (y > 600){
    y = 0;
  }

  println(mouseX + " " + mouseY);
}
