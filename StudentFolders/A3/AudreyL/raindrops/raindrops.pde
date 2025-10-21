//float x = 40;
float[] xs = new float[100];
//float y = 50;
float[] ys = new float[100];
float dia = 20;
float yspeed = 10;

void setup() {
  size(800, 600);
  for (int i = 0; i < 100; i++) {
    //start by 0, go to 99, with i progressing +1 each time
    xs[i] = random(width);
    ys[i] = random(height);
  }
  noStroke();
  //no border for raindrops
}
//need to replace all x and y variables with array xs[i] or ys[i]
void draw() {
  background(50);
  for (int i = 0; i < 100; i++) {
    ellipse(xs[i], ys[i], dia, dia);
    triangle(xs[i]-10, ys[i]-2, xs[i]+10, ys[i]-2, xs[i], ys[i]-20);
    //triangle(x-10, y-2, x+10, y-2, x, y-20);
    //last phrase don't use static number bc that will make the raindrop triangel vertice stay where it is and it will drag (not move with the circle))

    ys[i] =  ys[i] + yspeed;
    if ( ys[i] >= 600) {
      ys[i] = -40;
      xs[i] = random (0, width);
      // (0, width) to fit screen
    }
  }
}
