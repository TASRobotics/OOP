/*
 * Room 0 - Starting Room with Border Constraints
 * 
 * This room demonstrates:
 * - Border collision detection
 * - Room transition logic
 * - Decorative elements
 * 
 * Player can only move right to exit this room
 */

void screen0() {
  // Border constraints for room 0 - player can only move right
  if (y < 25) y = 25; // Stop at top border
  if (y > 575) y = 575; // Stop at bottom border  
  if (x < 25) x = 25; // Stop at left border
  // Allow right movement to transition to room 1

  // Decorative rectangles for visual interest
  // Rectangle 1
  fill(255, 0, 0); // Red color
  rect(100, 100, 150, 80); // x, y, width, height

  // Rectangle 2
  fill(0, 255, 0); // Green color
  rect(300, 200, 120, 150);

  // Rectangle 3
  fill(0, 0, 255); // Blue color
  rect(500, 350, 180, 100);

  // Rectangle 4
  fill(255, 255, 0); // Yellow color
  rect(650, 50, 100, 50);
  
  // Transition to room 1 when player moves off right edge
  if(x > 800){
    screen = 1; // Switch to room 1
    x = 0; // Reset player position to left side of room 1
  }
}
