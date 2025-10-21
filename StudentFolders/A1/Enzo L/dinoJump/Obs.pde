class Obs {
  PVector pos;
  PVector vel;
  float w;
  float h;
  color c;
  Obs() {
    pos = new PVector(750, 550);
    vel = new PVector(-4, 0);
    w = 50;
    h = 50;
  }
  void update() {
    pos.add(vel);
  }
  void display() {
    fill(255, 0, 0);
    rect(pos.x, pos.y, 25, 50);
  }
  void move() {
    pos.add(vel);
  }
}
