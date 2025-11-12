class Bullet {
  PVector pos;
  PVector speed;
  float d;


  Bullet(float x, float y) {
    pos = new PVector(x, y);
    speed = new PVector(0, -10);
    d = 10;
  }
  void update () {
    pos.add(speed);
  }
  void display() {
    circle(pos.x, pos.y, d);
  }
}
