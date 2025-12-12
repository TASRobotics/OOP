CoolText word;
CoolText word2;

void setup(){
  size(800, 600);
  word = new CoolText("Hiiiii!", 300, 200);
  word2 = new CoolText("Byeeeee :(", 500, 400);
}

void draw(){
 background(50); 
 word.display();
 word2.display();

}

void keyPressed(){
  if(key == ' '){
    word.toggleFlash();
  }
  if(key == 'p'){
    word.togglePulse();
  }
}
