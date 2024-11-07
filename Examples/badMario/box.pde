class Box {

  float bx;
  float by;
  float bw;
  float bh;
  boolean touching = false;

  Box(float x, float y, float w, float h) {
    bx = x;
    by = y;
    bw = w;
    bh = h;
  }

  void drawBox() {
    fill(255);
    rect(bx, by, bw, bh);
  }
  
  void stopPlayer() {
    touching = touchingBox();
    if (rectY < by && touching) {
      velocity = 0;
      onBox = true;
      isJumping = false;
    } 
  }

  boolean touchingBox() {
    if (rectRect(rectX, rectY, rectWidth, rectHeight, bx, by, bw, bh)) {
      return true;
    } else {
      return false;
    }
  }
}
