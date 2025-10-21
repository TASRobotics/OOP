
void setup() {
  size(600, 600);
}

void draw() {
  background(50);

  if ((mouseX < 200) || (mouseX > 400)) {
    background(255, 100, 0);
  } else {
    background(0);
  }
}
