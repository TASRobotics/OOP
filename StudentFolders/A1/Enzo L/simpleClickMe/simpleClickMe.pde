int counter = 0;
int counter2 =0;
void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  textSize(30);
}
void draw() {




  if (pointCircle(mouseX, mouseY, 300, 250, 100) == true) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }
  circle(300, 250, 100);
  fill(0);
  text(counter, 300, 250);
  if (pointCircle(mouseX, mouseY, 500, 250, 100) == true) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }
  circle(500, 250, 100);
  fill(0);
  text(counter2, 500, 250);
}

void mousePressed() {
  if (pointCircle(mouseX, mouseY, 300, 250, 100) == true) {
    counter++;
  }

  if (pointCircle(mouseX, mouseY, 500, 250, 100) == true) {
    counter2++;
  }
}

boolean pointCircle(float px, float py, float cx, float cy, float cr) {
  if (dist(px, py, cx, cy) < cr) {
    return true;
  } else {
    return false;
  }
}
