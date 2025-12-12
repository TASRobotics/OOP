/*
 * Aim A Bullet - Interactive Shooting Game
 * 
 * This sketch demonstrates a simple shooting game where:
 * - A cannon (white circle) is positioned at the bottom left
 * - Players can aim by moving their mouse
 * - Clicking fires bullets that bounce off screen edges
 * - The bullet trajectory is calculated based on mouse position
 * - Multiple bullets can be fired with a firing rate limit
 * 
 * Key concepts demonstrated:
 * - PVector mathematics for trajectory calculation
 * - ArrayList for managing multiple objects
 * - Object-oriented programming with custom Bullet class
 * - Collision detection with screen boundaries
 * - Frame-based timing for firing rate control
 */

PVector start = new PVector(50, 500); // Starting position of the cannon (bottom left corner)

PVector mouse; // Current mouse position (updated each frame)

PVector bullet = new PVector(50, 500); // Current bullet position (used for trajectory calculation)

PVector bulletVel = new PVector(0, 0); // Calculated bullet velocity based on mouse position

ArrayList<Bullet> bullets = new ArrayList<Bullet>(); // ArrayList to store all active bullets on screen

void setup() {
  //fullScreen(); // Uncomment for fullscreen mode
  size(800, 600); // Set canvas size to 800x600 pixels
}

void draw() {
  background(45); // Dark gray background
  
  circle(50, 500, 30); // Draw the cannon as a white circle at the starting position
  
  // Update and draw all active bullets
  for (Bullet b : bullets) {
    b.shoot(); // Move bullet and handle collisions
  }
  
  calc(); // Calculate bullet trajectory based on current mouse position
  
  // Fire a new bullet when mouse is pressed (with rate limiting)
  if (mousePressed && frameCount % 15 == 0) {
    bullets.add(new Bullet(start, new PVector(bulletVel.x, bulletVel.y))); // Add new bullet to the ArrayList with current velocity
  }
}

// Calculate bullet trajectory from cannon to mouse position
void calc() {
  mouse = new PVector(mouseX, mouseY); // Get current mouse coordinates as a PVector
  
  bullet = new PVector(50, 500); // Reset bullet position to cannon location
  
  PVector difference = PVector.sub(mouse, start); // Calculate the vector from cannon to mouse position
  
  println(difference.mag()); // Print the magnitude (distance) for debugging
  
  difference.setMag(10); // Normalize the direction vector and set speed to 10
  
  println(difference.x + " " + difference.y); // Print the velocity components for debugging
  
  bulletVel = difference; // Store the calculated velocity for bullet firing
}
