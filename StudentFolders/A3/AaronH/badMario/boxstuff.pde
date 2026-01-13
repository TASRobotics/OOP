void boxstuff(Box... boxes) {
  onBox = false;  // reset

  for (Box b : boxes) {
    // Check if player is landing on top of the box
    if (rectY + rectHeight <= b.by + 10 && 
        rectY + rectHeight + velocity >= b.by &&  // will land this frame
        rectX + rectWidth > b.bx && rectX < b.bx + b.bw) {

      rectY = b.by - rectHeight;  // place on top
      velocity = 0;
      onBox = true;
      isJumping = false;
    }
  }

  // If not on any box, allow gravity
  if (!onBox) {
    isJumping = true;
  }
}
