
void setup() {
  size(800, 600);
}

void draw() {
  background(50);

  if (mouseX < 400) {
    background(255, 100, 0);
  } else {
    background(0);
  }
}
