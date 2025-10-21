CoolText word;
CoolText otherword;

void setup() {
  size(800, 600);
  word = new CoolText(400, 300, "HELLO");
  otherword = new CoolText(500, 200, "YAYYY");
}

void draw() {
  //background(50);
  fill(0, 35);
  rect(0, 0, width, height);
  word.display();
  otherword.display();
}

void keyPressed() {
  if (key == ' ') {
    word.toggleParty();
  }
  if (key == 'p') {
    word.togglePulse();
    otherword.togglePulse();
  }
  if (key == 'w') {
    word.togglePulse();
  }
}
