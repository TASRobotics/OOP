class CoolText {
  PVector pos;
  String text;
  float size;
  float maxSize;
  float minSize;
  color c;
  boolean flash;
  float change;
  boolean pulse;
  CoolText(float x, float y, String text) {
    this.text = text;
    pos = new PVector(x, y);
    size = 50;
    maxSize = 50;
    minSize = 10;
    c = color(255);
    flash = false;
    pulse = false;
    change = 3;
  }


  void display() {
    if (pulse == true){
      pulse();
    }
    if (flash == true) {
      partyTime();
    }
    fill(c);
    textAlign(CENTER, CENTER);
    textSize(size);
    text(text, pos.x, pos.y);
  }

  void pulse() {

    size = size + change;
    if (size>maxSize || size < minSize) {
      change *= -1;
    }
  }

  void partyTime() {
    c = color(random(0, 255), random(0, 255), random(0, 255));
    line(400, 0, 400, 100);
    fill(c);
    circle(400, 100, 50);
  }
  void toggleParty() {
    flash = !flash;
  }
  void togglePulse() {
    pulse =!pulse;
  }
}
