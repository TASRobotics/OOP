class CoolText {
  PVector pos;
  float txtSize;
  color c;
  float speed;
  float maxSize;
  float minSize;
  String label;
  boolean flashing;

  CoolText(String label, float x, float y) {
    pos = new PVector(x, y);
    this.label = label;
    txtSize = 40;
    c = color(255);
    speed = 1.5;
    maxSize = 80;
    minSize = 10;
    flashing = false;
  }

  void pulse() {
    txtSize += speed;
    if (txtSize > maxSize || txtSize < minSize) {
      speed *= -1;
    }
  }

  void chameleon() {
    if (!flashing) { // only change color when not flashing
      c = color(random(255), random(255), random(255));
    }
  }

  void toggleFlash() {
    flashing = !flashing;
  }

  void display() {
    if (flashing) {
      if (frameCount % 6 == 0) { // changes color every few frames
        c = color(random(255), random(255), random(255));
      }
    }
    fill(c);
    textSize(txtSize);
    textAlign(CENTER, CENTER);
    text(label, pos.x, pos.y);
  }
}
