int num = 400;

color[] rainbow = new color[num];
float[] xs = new float[num];
float[] ys = new float[num];
float[] sizes = new float[num];
void setup() {
  //fullScreen();
  size(800, 600);
  noStroke();
  for (int i = 0; i < rainbow.length; i++) {
    color temp = color(random(10, 120), random(10, 120), random(200, 255));
    rainbow[i] = temp;
    xs[i] = random(width);
    ys[i] = random(height);
    sizes[i] = random(20, 100);
  }
}

void draw() {
  if (mousePressed) {
    for (int i = 0; i < rainbow.length; i++) { //go through all the array indexes
      sizes[i] += random(-5, 5.00001);
    }
  }

  background(180);
  for (int i = 0; i < rainbow.length; i++) {
    fill(rainbow[i]);
    circle(xs[i], ys[i], sizes[i]);
  }
}
