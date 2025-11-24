class Box {
  float bx, by, bw, bh;

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
    boolean touching = rectRect(rectX, rectY, rectWidth, rectHeight, bx, by, bw, bh);

    // Land on top
    if (touching && rectY + rectHeight <= by + 10 && velocity >= 0 &&
        rectX + rectWidth > bx && rectX < bx + bw) {
      rectY = by - rectHeight;
      velocity = 0;
      isJumping = false;
      onBox = true;
    } 
    // Hitting sides
    else if (touching && rectY + rectHeight > by && rectY < by + bh) {
      if (rectX + rectWidth > bx && rectX < bx) {
        rectX = bx - rectWidth; // left side
      } else if (rectX < bx + bw && rectX + rectWidth > bx + bw) {
        rectX = bx + bw;        // right side
      }
    }
    // Hitting bottom
    else if (touching && rectY < by + bh && velocity < 0 &&
             rectX + rectWidth > bx && rectX < bx + bw) {
      rectY = by + bh;
      velocity = 0.5;
    }

    // Reset onBox only if not standing on top
    if (!(rectY + rectHeight == by)) {
      onBox = false;
    }
  }
}
