color c = color(255, 0, 0);
int lastChanged = -1000;

void setup() {
  //fullScreen();
  size(800, 600);
  background(50);
  noStroke();
}

void draw() {
  background(c);
  println(frameCount);

  //counting since last event method
  if (mousePressed) {
    if (frameCount - lastChanged > 30) {
      c = color(random(255), random(255), random(255));
      lastChanged = frameCount;
    }
  }
  




  //Frame Counting Example
  //if (mousePressed) {
  //  if (frameCount % 5 == 0) {
  //    //circle(random(width), random(height), 25);
  //    fill(255, 50);
  //    circle(mouseX + random(-20, 20), mouseY + random(-20, 20), 25);
  //  }
  //}
}


void mousePressed() {
}
