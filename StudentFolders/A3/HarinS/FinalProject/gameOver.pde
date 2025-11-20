void goscreen() {
  // Border constraints for room 1 - player can only move left to return to room 0
  //if (y < 25) y = 25; // Stop at top border
  //if (y > 575) y = 575; // Stop at bottom border
  //if (x > 775) x = 775; // Stop at right border
  // Allow left movement to transition back to room 0

background(255, 0, 0);
textSize(150);
fill(255);
text("GAME OVER", 30, 300);
}
