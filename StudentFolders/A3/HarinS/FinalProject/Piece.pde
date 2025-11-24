class Piece {
  float x, y, w, h;
  color c;
  boolean dragging = false;
  float offsetX, offsetY;

  Piece(float x, float y, float w, float h, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
  }

  void show() {
    fill(c);
    rect(x, y, w, h);
  }

  boolean over(float mx, float my) {
    return mx >= x && mx <= x + w &&
           my >= y && my <= y + h;
  }

  void startDrag(float mx, float my) {
    dragging = true;
    offsetX = mx - x;
    offsetY = my - y;
  }

  void drag(float mx, float my) {
    if (dragging) {
      x = mx - offsetX;
      y = my - offsetY;
    }
  }

  void stopDrag() {
    dragging = false;
  }
}

void mouseDragged() {
  if (jigsaw && selected != null) {
    selected.drag(mouseX, mouseY);
  }
}

void mouseReleased() {
  if (jigsaw && selected != null) {
    selected.stopDrag();
    selected = null;
  }
}
