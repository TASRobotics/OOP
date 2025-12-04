class DropZone {
  public float dropx, dropy, dropw, droph;
   DropZone(float x, float y, float w, float h) {
    dropx = x;
    dropy = y;
    dropw = w;
    droph = h;
  }

  void show() {
    fill(150);
    rect(dropx, dropy, dropw, droph);
  }

  PVector center() {
    return new PVector(dropx + dropw/2, dropy + droph/2);
  }
}
