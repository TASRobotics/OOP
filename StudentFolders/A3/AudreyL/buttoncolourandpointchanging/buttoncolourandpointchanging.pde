int count = 0;



void setup() {
  size(800, 600);
}

void draw() {
  background(50);
  if (pointCircle(mouseX, mouseY, 400, 300, 100)) {
    fill(255, 0, 0);
  } else {
  }
  circle(mouseX, mouseY, 4);
  circle(400, 300, 100);
  fill(0);
  text(count, 400, 300);
  textSize(20);
  textAlign(CENTER, CENTER);
  if (pointCircle(mouseX, mouseY, 100, 200, 100)) {
    fill(255, 0, 0);
  } else {
  }
  circle(mouseX, mouseY, 4);
  circle(100, 200, 100);
  fill(0);
  text(count, 400, 300);
  textSize(20);
  textAlign(CENTER, CENTER);
}

void mousePressed() {
  if (pointCircle(mouseX, mouseY, 400, 300, 50)){
    count++;
  }
}

  boolean pointCircle(float px, float py, float cx, float cy, float cr) {
    if (dist(px, py, cx, cy) < cr) {
      return true;
    } else {
      return false;
    }
  }
