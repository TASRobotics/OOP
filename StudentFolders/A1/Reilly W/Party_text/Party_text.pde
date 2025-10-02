CoolText word;


void setup() {
  size (800, 600);
  word = new CoolText(400, 300, "Hello");
}

void draw() {
  background(50);
  word.display();
  //word.partyTime();
}

void keyPressed() {
  if (key == ' ' ) {
    word.toggleParty();
  }
  if (key == 'p') {
    word.togglePulse();
  }
}
