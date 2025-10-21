/*
 * Bullet Class - Individual Bullet Object
 * 
 * This class represents a single bullet in the shooting game.
 * Each bullet has a position and velocity, and can move and bounce
 * off screen boundaries. The bullet is drawn as a small circle
 * and moves according to its velocity vector.
 * 
 * Key features:
 * - Position tracking with PVector
 * - Velocity-based movement
 * - Screen boundary collision detection
 * - Bouncing physics (velocity reversal on collision)
 */

class Bullet {
  // Current position of the bullet on screen
  PVector loc;
  
  // Velocity vector determining bullet movement direction and speed
  PVector vel;
  
  // Constructor: creates a new bullet with given position and velocity
  Bullet(PVector l, PVector v){
    // Create copies to avoid modifying original vectors
    loc = l.copy();
    vel = v.copy();
  }
  
  // Main update method: moves bullet and handles collisions
  void shoot(){
    // Move bullet by adding velocity to position
    loc.add(vel);
    
    // Draw bullet as a small white circle
    circle(loc.x, loc.y, 10);
    
    // Check for horizontal boundary collision (left and right edges)
    if(loc.x > width || loc.x < 0){
      // Reverse horizontal velocity to create bouncing effect
      vel.x = -vel.x;
    }
    
    // Check for vertical boundary collision (top and bottom edges)
    if(loc.y > height || loc.y < 0){
      // Reverse vertical velocity to create bouncing effect
      vel.y = -vel.y;
    }
  }
}
