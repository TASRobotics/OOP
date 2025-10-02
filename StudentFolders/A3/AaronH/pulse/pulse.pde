CoolText word;
CoolText word2;

void setup() {
  size(800, 600);
  word = new CoolText("Java", 300, 300);
  word2 = new CoolText("Lol", 500, 300);
}

void draw() {
  background(50);

  
  word.pulse();
  word.display();

  word2.pulse();
  word2.chameleon(); 
  word2.display();
}

void keyPressed() {
  if (key == ' ') {
    word.toggleFlash();
    word2.toggleFlash();
  }
}
