CoolText word;
CoolText word2;


void setup(){
  size(800, 600);
  word = new CoolText("UwU", 400, 200);
  word2 = new CoolText("GYATT", 400, 300);
}

void draw(){
  background(120);
  word.display();
  word2.display();

}

void keyPressed() {
  if (key == ' '){
    word.toggleFlash();
  }
  if (key == '1'){
    word2.toggleFlash();
  }
  if (key == '2'){
    word.togglePulse();
  }
  if (key == '3'){
    word2.togglePulse();
  }
}
