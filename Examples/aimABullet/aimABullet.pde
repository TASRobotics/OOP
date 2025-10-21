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

// Starting position of the cannon (bottom left corner)
PVector start = new PVector(50, 500);

// Current mouse position (updated each frame)
PVector mouse;

// Current bullet position (used for trajectory calculation)
PVector bullet = new PVector(50, 500);

// Calculated bullet velocity based on mouse position
PVector bulletVel = new PVector(0, 0);

// ArrayList to store all active bullets on screen
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

void setup() {
  //fullScreen(); // Uncomment for fullscreen mode
  size(800, 600); // Set canvas size to 800x600 pixels
}

void draw() {
  background(45); // Dark gray background
  
  // Draw the cannon as a white circle at the starting position
  circle(50, 500, 30);
  
  // Update and draw all active bullets
  for (Bullet b : bullets) {
    b.shoot(); // Move bullet and handle collisions
  }
  
  // Calculate bullet trajectory based on current mouse position
  calc();
  
  // Fire a new bullet when mouse is pressed (with rate limiting)
  if (mousePressed && frameCount % 15 == 0) {
    // Add new bullet to the ArrayList with current velocity
    bullets.add(new Bullet(start, new PVector(bulletVel.x, bulletVel.y)));
  }
}

// Calculate bullet trajectory from cannon to mouse position
void calc() {
  // Get current mouse coordinates as a PVector
  mouse = new PVector(mouseX, mouseY);
  
  // Reset bullet position to cannon location
  bullet = new PVector(50, 500);
  
  // Calculate the vector from cannon to mouse position
  PVector difference = PVector.sub(mouse, start);
  
  // Print the magnitude (distance) for debugging
  println(difference.mag());
  
  // Normalize the direction vector and set speed to 10
  difference.setMag(10);
  
  // Print the velocity components for debugging
  println(difference.x + " " + difference.y);
  
  // Store the calculated velocity for bullet firing
  bulletVel = difference;
}
