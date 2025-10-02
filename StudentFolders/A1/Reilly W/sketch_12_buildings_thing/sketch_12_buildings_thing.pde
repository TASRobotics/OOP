void setup() {
  fullScreen();
}

void draw() {
  background(120);
  for (int i = 100; i< width; i += width/3) {
    for (int v = 100; v<height; v += height/4) {
      square(i, v, 50);
    }
  }
}
