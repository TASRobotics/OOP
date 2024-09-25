float cx = 400;
float cy = -50;

void setup() {
  //fullScreen();
  size(800, 600);
}

void draw() {
  if (pointRect(cx, cy, mouseX - 50, 550, 100, 40) == true) {
    background(255, 0, 0);
  } else {
    background(50);
  }

  circle(cx, cy, 50);
  cy += 5;
  if (cy > height) {
    cy = -50;
  }
  rect(mouseX - 50, 550, 100, 40);
}
