float[] x = new float[100];
float[] y = new float[100];
float[] d = new float[100];

void setup() {
  //fullScreen();
  size(800, 600);
  for (int i = 0; i < 100; i = i + 1) {
    x[i] = random(0, width);
    y[i] = random(0, height);
    d[i] = 40;
  }
}

void draw() {
  background(50);
  for (int i = 0; i < 100; i = i + 1) {

    y[i] += 3;
    if (y[i] > height) {
      y[i] = -50;
      x[i] = random(width);
    }
    if (pointCircle(mouseX, mouseY, x[i], y[i], 20) == true) {
      fill(255, 0, 0);
      d[i] = 100;
    } else {
      fill(0, 0, 0);
      d[i] = 40;
    }
    circle(x[i], y[i], d[i]);
  }
}
