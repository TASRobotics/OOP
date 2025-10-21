float [] x = new float [100];
float [] y = new float [100];
float [] speed = new float [100];


void setup() {
  size(800, 600);
  for (int i = 0; i < 100; i +=1) {
    x[i] = random(width);
    y[i] = random(height);
    speed[i] = random(1,10);
  }
}

void draw() {
  fill(200,50);
  rect(0,0,800,600);
  for (int i = 0; i < 100; i++) {
    fill(70, 180, 250);
    noStroke();
    circle(x[i], y[i], 50);
    triangle(x[i] + 22.5, y[i] -10, x[i] - 22.5, y[i] - 10, x[i], y[i] - 50);
    y[i] += speed[i];

    if (y[i] >= height + 50) {
      y[i] = -50;
      x[i] = random(50, 750);
    }
  }
}
