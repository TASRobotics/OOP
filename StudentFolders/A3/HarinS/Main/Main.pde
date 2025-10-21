int point = 0;
int point1 = 0;
int point2 = 0;

void setup() {
  size(800, 600);
  textSize(20);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(50);
  if (pointCircle(mouseX, mouseY, 400, 300, 100)) {
    fill(255, 255, 0);
  } else {
    fill(255);
  }
  circle(400, 300, 100);
  fill(0);
  text(point, 400, 300);

  if (pointCircle(mouseX, mouseY, 200, 100, 100)) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }
  circle(200, 100, 100);
  fill(0);
  text(point1, 200, 100);
  
  if (pointCircle(mouseX, mouseY, 600, 400, 100)) {
    fill(0, 255, 0);
  } else {
    fill(255);
  }
  circle(600, 400, 100);
  fill(0);
  text(point2, 600, 400);
}

void mousePressed() {
  if (pointCircle(mouseX, mouseY, 400, 300, 100)) {
    point = point + 1;
  }
  if (pointCircle(mouseX, mouseY, 200, 100, 100)) {
    point1 = point1 + 1;
  }
  if (pointCircle(mouseX, mouseY, 600, 400, 100)) {
    point2 = point2 + 1;
  }
}
