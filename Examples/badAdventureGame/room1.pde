/*
 * Room 1 - Sword Collection Room with Border Constraints
 * 
 * This room demonstrates:
 * - Border collision detection
 * - Item collection mechanics
 * - Room transition logic
 * - Conditional item rendering
 * 
 * Player can only move left to return to room 0
 */

void screen1() {
  // Border constraints for room 1 - player can only move left to return to room 0
  if (y < 25) y = 25; // Stop at top border
  if (y > 575) y = 575; // Stop at bottom border
  if (x > 775) x = 775; // Stop at right border
  // Allow left movement to transition back to room 0

  // Decorative rectangles for visual interest
  // Rectangle 1
  fill(255, 165, 0); // Bright Orange
  rect(150, 120, 180, 90); // x, y, width, height

  // Rectangle 2
  fill(75, 0, 130); // Indigo
  rect(350, 250, 140, 120);

  // Rectangle 3
  fill(0, 255, 255); // Cyan
  rect(500, 100, 200, 150);

  // Rectangle 4
  fill(255, 20, 147); // Deep Pink
  rect(600, 400, 160, 90);
  
  // Check for sword collection and render sword if not collected
  checkIfPlayerIsTouchingSword(); // Check if player is touching the sword
  if(!playerHasSword){ // Only draw sword if player hasn't collected it
   drawSwordOnFloor(); // Draw sword on the floor
  }

  // Transition back to room 0 when player moves off left edge
  if (x < 0) {
    screen = 0; // Switch back to room 0
    x = 800; // Reset player position to right side of room 0
  }
}

void checkIfPlayerIsTouchingSword(){
  // Check if player (circle) is touching the sword (rectangle)
  // Parameters: player x, player y, player radius, sword x, sword y, sword width, sword height
  if(circleRect(x, y, 25, 40, 10, 20, 60)){
    playerHasSword = true; // Player has collected the sword
  }
  
}
