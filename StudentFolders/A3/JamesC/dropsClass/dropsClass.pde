Drop[] drops = new Drop[100];

void setup() {
  //fullScreen();
  size(800, 600);
  for (int i = 0; i < 100; i++) {
    drops[i] = new Drop();
  }
}

void draw() {
  background(50);
  for (int i = 0; i < 100; i++) {
    drops[i].drawAndMove();
  }
}
