int counter = 0; //score variable, starts at 0
int counter2 = 0;
void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  textSize(30);
}

void draw() {
  //background(50);

  if (pointCircle(mouseX, mouseY, 400, 300, 50) == true) { //change color when hovered
    fill(255, 0, 0);
  } else {
    fill(255);
  }
  circle(400, 300, 100);
  fill(0);
  text(counter, 400, 300);


  if (pointCircle(mouseX, mouseY, 400, 300, 50) == true) { //change color when hovered
    fill(255, 0, 0);
  } else {
    fill(255);
  }
  circle(400, 300, 100);
  fill(0);
  text(counter, 400, 300);
}

void mousePressed() {
  if (pointCircle(mouseX, mouseY, 400, 300, 50) == true) {
    counter++;
  }
}


boolean pointCircle(float px, float py, float cx, float cy, float cr) {
  if (dist(px, py, cx, cy) < cr) {
    return true;
  } else {
    return false;
  }
}
