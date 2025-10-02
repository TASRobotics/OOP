class CoolText { //use captial for class lets ppl know its a class/object, not a variable
  PVector pos;
  float size;
  color c;
  float speed;
  float maxSize;
  float minSize;
  String text;
  boolean flashing;

  CoolText(String text, float x, float y) { //need to give new position --> constructor --> set up new variables/what we need
    pos = new PVector(x, y);
    this.text = text; //comp. gets confused if ur talking abt general text or specified text (one of the circles)
    size = 40;
    c = color(255);
    speed = 2;
    maxSize = 50;
    minSize = 5;
    flashing = false;
  }

  void display() {
    if(flashing == true){
      chameleon(); //word.display in "sketch", so know under display here, only word will change
    }
    fill(c);
    textSize(size);
    textAlign(CENTER, CENTER); //when growing/shrinking, start from center
    text(text, pos.x, pos.y);
  }
  void pulse() {
    size = size + speed;
    if (size > maxSize || size < minSize) {
      speed = -speed;
    }
  }
  void chameleon() {
    c = color(random(255), random(255), random(255));
    
  }
  void toggleFlash(){
    flashing = !flashing; //flips from true to false, kinda like speed = -speed but for booleans
}
}
