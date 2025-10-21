color[] rainbow = {color(255, 0, 0), color(255, 165, 0), color(255, 255, 0), color(0, 128, 0), color(0, 0, 255)};
int selectedColor = 0;

void setup() {
  size(800, 600);
}

void draw() {
  background(50);
  fill(rainbow[selectedColor]);
  circle(400, 300, 100);
}

void keyPressed() {
  if (key == ' ') {
    selectedColor = selectedColor + 1;
    if (selectedColor >= rainbow.length) selectedColor = 0;
  }
  if (key == 'a' ) {
    selectedColor = selectedColor - 1;
    if (selectedColor < 0) selectedColor = rainbow.length - 1;
  }
}
