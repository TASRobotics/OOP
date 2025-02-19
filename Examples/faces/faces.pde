float x = 300;
float y = 100;

float x2 = 700;
float y2 = 150;

float x3 = 500;
float y3 = 400;

void setup() {
  size(1200, 800);
}

void draw() {
  //background(255);
  circle(x, y, 100);
  y = y + 7;

  if (y > 850) {
    y = -50;
    x = random(0, 1200);
  }
  circle(x2, y2, 100);
  y2 = y2 + 7;
  if (y2 > 850) {
    y2 = -50;
    x2 = random(0, 1200);
  }
  circle(x3, y3, 100);
  x3 = x3 + 7;
  if (x3 > 1250) {
    x3 = -50;
    y3 = random(0, 800);
  }
}
