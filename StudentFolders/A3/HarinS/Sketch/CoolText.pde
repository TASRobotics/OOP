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
  
   CoolText(String text, float x, float y){
     pos = new PVector(x, y);
     this.text = text;
     size = 40;
     c = color(255);
     speed = 2;
     maxSize = 80;
     minSize = 10;
     flashing = false;
     pulsing = false;
   }
   
   void display(){
     fill(c);
     textSize(size);
     textAlign(CENTER, CENTER);
     text(text, pos.x, pos.y);
     if (flashing == true){
       chameleon();
     }
     if (pulsing == true){
       pulse();
     }
   }
   
   void pulse(){
     size = size + speed;
     if (size >= maxSize || size <= minSize){
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
