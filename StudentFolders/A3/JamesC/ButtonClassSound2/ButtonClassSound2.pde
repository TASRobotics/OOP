import processing.sound.*;

Button b1;
Button b2;
Button b3;

SoundFile a;
SoundFile b;

int size = 100;

void setup() {
  //fullScreen();
  size(800, 600);
  b1 = new Button(100, 300, 100);
  b2 = new Button(100, 100, 50);
  b3 = new Button(500, 500, 75);
  a = new SoundFile(this, "1.aif");
  b = new SoundFile(this, "5.aif");
}

void draw() {
  background(50);
  b1.display();
  b2.display();
  b3.display();
  fill(255, 100, 100);
  circle(400, 300, size);
}

void mousePressed() {
  if (b1.check() == true) {
    size += 10;
    //a.play(1.0);
  }
  b2.check();
  if (b3.check() == true) {
    size -= 10;
    //b.play(1.5);
  }
}

boolean pointCircle(float px, float py, float cx, float cy, float cr) {
  if (dist(px, py, cx, cy) < cr) {
    return true;
  } else {
    return false;
  }
}
