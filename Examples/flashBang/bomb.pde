/*
 * Bomb Class - Base Explosive Object
 * 
 * This class represents a flash bomb that blinds the player when detonated.
 * It serves as the base class for all explosive objects in the game.
 * 
 * Key features:
 * - 3-second fuse timer with visual countdown
 * - Collision detection with player
 * - Visual explosion effect when detonating
 * - Screen flash effect on player hit
 * - Automatic cleanup after explosion
 * 
 * The bomb uses a two-phase system:
 * 1. Fuse phase: Shows countdown and waits for timer
 * 2. Explosion phase: Shows red circle and checks for player collision
 */

class Bomb {
  // Bomb position coordinates
  float bx;
  float by;
  
  // Explosion parameters
  float damageRadius;  // Radius of explosion effect (75 pixels)
  float drawRadius;    // Visual size of bomb (18 pixels)
  
  // Timing system
  int timeCreated;     // When bomb was created (milliseconds)
  int fuseTime;        // How long until explosion (3000ms = 3 seconds)
  boolean exploded = false;  // Whether bomb has finished exploding
  int timeleft;        // Seconds remaining until explosion
  
  // Visual state
  boolean showExplosion = false;  // Whether to show explosion effect
  color c;             // Bomb color (dark gray)

  // Constructor: creates a new bomb at specified position
  Bomb(float _x, float _y) {
    bx = _x;           // Set bomb X position
    by = _y;           // Set bomb Y position
    damageRadius = 75; // Set explosion radius
    drawRadius = 18;   // Set visual bomb size
    timeCreated = millis(); // Record creation time
    fuseTime = 3000;   // Set 3-second fuse
    c = color(60);     // Set dark gray color
  }

  // Display the bomb with countdown and explosion effect
  void display() {
    textAlign(CENTER, CENTER); // Center text on bomb
    
    // Draw the bomb body
    fill(c);
    circle(bx, by, drawRadius*2);
    
    // Draw countdown timer on bomb
    fill(255); // White text
    text(timeleft, bx, by);
    
    // Show explosion effect if bomb has detonated
    if (showExplosion) {
      fill(255, 0, 0); // Red explosion circle
      circle(bx, by, damageRadius * 2);
    }
  }

  // Main update logic: handle timing and collision detection
  void logic(float px, float py) {
    // Calculate seconds remaining until explosion
    timeleft = (timeCreated + fuseTime - millis())/1000;
    
    // Check if explosion phase is complete (remove bomb)
    if (millis() >= timeCreated + fuseTime && showExplosion == true) {
      exploded = true; // Mark for removal from ArrayList
    }

    // Check if it's time to explode
    if ( millis() >= timeCreated + fuseTime && !exploded) {
      showExplosion = true; // Start showing explosion effect
      
      // Check collision between explosion and player
      if (circleCircle(bx, by, damageRadius, px, py, 25)) {
        action(); // Trigger bomb effect on player
      }
    }
  }

  // Action performed when player is hit by explosion
  void action() {
    playerBlind = true; // Trigger screen flash effect
  }
}
