class Piece {
  float x, y, w, h;
  color c;
  boolean dragging = false;
  float offsetX, offsetY;
  String label;

  Piece(float x, float y, float w, float h, color c, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.label = label;
  }

  void show() {
    fill(c);
    rect(x, y, w, h);

    fill(0);             
    textSize(32);
    textAlign(CENTER, CENTER);
    text(label, x + w/2, y + h/2);
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
    for (DropZone z : zones) {
      if (rectRect(mouseX, mouseY, 100, 100, ) {
        ;
      }
    }
    selected.stopDrag();
    selected = null;
  }
}
