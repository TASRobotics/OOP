class startplatform {
  PVector pos;
  float w;
  float h;
  float x=350;
  float y=75;
  startplatform(){
    pos = new PVector(x,y);
    w=200;
    h=60;
  }
  void display() {
    rect(x,y,w,h);
  }
}
  
