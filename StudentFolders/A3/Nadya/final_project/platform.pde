class Platform {
  float x, y, w = 80, h = 15;
  boolean landed = false;

  Platform(float x, float y) {
    this.x = x;
    this.y = y;
  }

  Platform() {
    this.x = 0;
    this.y = 0;
  }

  void display() {
    fill(#F8FA8D);
    rect(x, y, w, h, 5);
  }
}
