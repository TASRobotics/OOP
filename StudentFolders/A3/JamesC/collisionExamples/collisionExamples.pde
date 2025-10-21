String screen = "pointCircle";

void setup() {
  fullScreen();
}

void draw() {
  background(50);
  if (screen.equals("pointCircle")) {
    circle(mouseX, mouseY, 4);
    circle(400, 300, 100);
    if (pointCircle(mouseX, mouseY, 400, 300, 100) == true) {
      screen = "circleCircle";
    }
  } else if (screen.equals("circleCircle")) {
    circle(mouseX, mouseY, 100);
    circle(700, 400, 75);
    if (circleCircle(mouseX, mouseY, 100,700, 400, 75) == true) {
      screen = "pointRect";
    }
  } else if (screen.equals("pointRect")) {
    circle(mouseX, mouseY, 4);
    rect(100, 100, 300, 50);
    if (pointRect(mouseX, mouseY, 100, 100, 300, 50) == true) {
      screen = "rectRect";
    }
  } else if (screen.equals("rectRect")) {
    rect(mouseX, mouseY, 100, 100);
    rect(100, height-100, 500, 75);
    if (rectRect(mouseX, mouseY, 100, 100, 100, height-100, 500, 75) == true) {
      screen = "circleRect";
    }
  } else if (screen.equals("circleRect")){
    circle(mouseX, mouseY, 50);
    rect(400, 0, 150, 150);
    if (rectRect(mouseX, mouseY, 100, 100, 100, height-100, 500, 75) == true) {
      screen = "circleRect";
    }
  }
}

void keyPressed() {
}

void mousePressed() {
}
