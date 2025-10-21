class CoolText {
  PVector pos;
  float size;
  color c;
  float speed;
  float maxSize;
  float minSize;
  String text;
  boolean flashing;
  boolean pulsing;

  CoolText(String t, float x, float y) {
    pos = new PVector(x, y);
    text = t;
    size = 40;
    c = color(255);
    speed = 2;
    maxSize = 80;
    minSize = 10;
    flashing = false;
    pulsing = false;
  }

  void display() {
    if(flashing == true){
      chameleon();
    }
    if(pulsing == true){
      pulse();
    }
    
    fill(c);
    textSize(size);
    textAlign(CENTER, CENTER);
    text(text, pos.x, pos.y);
  }
  void pulse() {
    size = size + speed;
    if(size > maxSize || size < minSize){
      speed = -speed;
    }
  }
  void chameleon(){
    c = color(random(255), random(255), random(255));
  }
  
  void toggleFlash(){
    flashing = !flashing;
  }
  void togglePulse(){
    pulsing = !pulsing;
  }
}
