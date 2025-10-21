float x = 40;
float y = 50;
float dia = 20;
float yspeed = 3;


void setup() {
  size(800, 600);
  noStroke();
}

void draw() {
  background(50);

  triangle(x-10, y-2, x+10, y-2, x, y-20);
  ellipse(x, y, dia, dia);

  y =  y + yspeed;
  if ( y >= 600) {
    y = -40;
    x = random (100, 700);
  }

  //println(mousex + " "
}
