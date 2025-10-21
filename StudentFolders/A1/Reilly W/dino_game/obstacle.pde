class Obstacle {
  PVector Opos;
  PVector vel;
  float w;
  float h;

  Obstacle() {

    w = 20;
    h = 50;
    Opos = new PVector(width-w, height -h);
    vel = new PVector(-8, 0);
  }

  void move() {
    Opos.add(vel);
  }

  void display() {
    fill(200, 0, 50);
    rect(Opos.x, Opos.y, w, h);
  }
}
