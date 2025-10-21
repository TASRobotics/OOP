class CoolText {
  PVector pos;
  String text;
  float size;
  float maxSize;
  float minSize;
  color c;
  boolean flash;
  boolean pulse;
  float change;
  
  CoolText(float x, float y, String text){
    this.text = text;
    pos = new PVector(x, y);
    size = 30;
    maxSize = 60;
    minSize = 10;
    c = color(255);
    flash = false;
    pulse = false;
    change = 3;
  }
  
  void display(){
    if(pulse == true){
      pulse();
    }
    if(flash == true){
      partyTime();
    }
    fill(c);
    textAlign(CENTER, CENTER);
    textSize(size);
    text(text, pos.x, pos.y);
  }
  
  void pulse(){
    size = size + change;
    if(size > maxSize || size < minSize){
      change = -change;
    }
  }
  
  void partyTime(){
    c = color(random(255), random(255), random(255));
  }
  
  void toggleParty(){
    flash = !flash;
  }
  void togglePulse(){
    pulse = !pulse;
  }
}
