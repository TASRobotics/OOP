class Bush extends Static {
  Bush(PVector pos, int w, int h) {
    super(pos, w, h);
  }
  
  public void display() {
    fill(8, 107, 57, 255);
    stroke(0);
    strokeWeight(2);
    ellipse(pos.x, pos.y, w, h);
  }
}
