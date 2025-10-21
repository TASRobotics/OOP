class Reverse {
  float x, y, s;
  float counter = 0;
  float incr = 0.005;
  float offset;
  Reverse() {
    //x = random(width);
    //y = random(height);
    x = map(noise(counter), 0, 1, 0, width);
    y = map(noise(counter), 0, 1, 0, height);
    s = 20;
    offset = random(0, 1);
  }

  void show() {
    fill(100, 255, 255);
    ellipse(x, y, s, s);
    x = map(noise(counter), 0, 1, 0, width);
    y = map(noise(counter + offset), 0, 1, 0, height);
    counter += incr;
    offset += incr;
  }
}
