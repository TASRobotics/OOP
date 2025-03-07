class Glue {
  float x, y;
  boolean alive = true;

  Glue(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    fill(100, 100, 255, 150);
    ellipse(x, y, 40, 40);
  }
  void delete(){
    alive = false;
  }
}
