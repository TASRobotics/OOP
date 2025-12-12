CoolText word;
CoolText word2;


void setup() {
  size(800, 600);
  word = new CoolText("Cookie", 300, 200);
  word2 = new CoolText("poundcake", 500, 400);
}

void draw() {
  background(50);
  word.display(); //a command to show the word on the screen
  word2.display();
  word.pulse();
  word2.chameleon();
}

void keyPressed() {
  if (key == ' ') {
    word.toggleFlash();
  }
}
