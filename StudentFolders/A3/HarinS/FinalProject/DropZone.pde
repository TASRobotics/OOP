class DropZone {
  float x, y, w, h;
  DropZone(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void show() {
    fill(150);
    rect(x, y, w, h);
  }

  PVector center() {
    return new PVector(x + w/2, y + h/2);
  }
}
