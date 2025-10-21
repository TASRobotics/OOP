
void setup() {
  size(800, 600);
}

void draw() {
  background(50);

  if ((mouseX < 400) && (mouseY > 300)) {
    background(255, 100, 0);
  } else if ((mouseX < 400) && (mouseY < 300)) {
    background(255, 0, 0);
  } else if ((mouseX > 400) && (mouseY < 300)) {
    background(0, 350, 0);
  } else {
    background(0);
  }
}
