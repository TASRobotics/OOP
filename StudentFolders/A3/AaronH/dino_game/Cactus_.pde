class Cactus {
  PVector pos;
  float w, h;
  float speed;

  Cactus() {
    w = 30;
    h = 60;
    pos = new PVector(width, 500); 
    speed = 5;
  }

  void update() {
    pos.x -= speed;
  }

  void display() {
    fill(0, 200, 0);
    rect(pos.x, pos.y, w, h);
  }
}
