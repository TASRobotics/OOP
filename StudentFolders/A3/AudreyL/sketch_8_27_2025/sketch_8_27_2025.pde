float x = 100;
float y = 600;
float dia = 100;
float yspeed = 0;
float y2 = 100

void setup() {
  size(800, 600);
}

void draw() {
  background(50);
  ellipse(x, y, dia, dia);


  y = y + yspeed;
    if (y <= 0) {
    y = 550;
    x = random(50,100);
  }
}

if (y2 <= -0) {
