float x = 600;
float y = 100;
float[] xs = new float[50]; //float x = 400;
float[] ys = new float[50]; //float y = 300;


void setup() {
  //fullScreen();
  size(800, 600);
  noStroke();
  for (int i = 0; i < 100; i++) {
    xs[i] = random(width);
    ys[i] = random(height);
  }
}

void draw() {
  background(150);
  fill(75, 0, 150);
  for (int i = 0; i < 100; i++) {
    
    circle(xs[i], ys[i], 50);
    triangle(xs[i]-23, ys[i]-10, xs[i]+23, ys[i]-10, xs[i], ys[i]-40);
    ys[i] += 10;
    if (ys[i] > height + 50) {
      ys[i] = -50;
    }
  }
}
