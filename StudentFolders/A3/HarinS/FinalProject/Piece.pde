class Piece {
  float x, y, w, h;
  color c;
  boolean dragging = false;
  float offsetX, offsetY;
  String label;
  int targetZone;

  Piece(float x, float y, float w, float h, color c, String label, int targetZone) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.label = label;
    this.targetZone = targetZone;
  }

  boolean over(float mx, float my) {
    return mx >= x && mx <= x + w &&
      my >= y && my <= y + h;
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

    DropZone correct = zones[selected.targetZone];
    if (rectRect(correct.dropx, correct.dropy, correct.dropw, correct.droph, selected.x, selected.y, selected.w, selected.h)){
    //if (mouseX >= correct.dropx && mouseX <= correct.dropx + correct.dropw && mouseY >= correct.dropy && mouseY <= correct.dropy + correct.droph) {
      
      PVector center = correct.center();
      selected.x = center.x - selected.w/2;
      selected.y = center.y - selected.h/2;
    }

    selected.stopDrag();
    selected = null;
  }
  }
