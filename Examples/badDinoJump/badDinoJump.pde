/*
 * Bad Dino Jump - Simple Jumping Game with Collision Detection
 * 
 * This sketch demonstrates:
 * - Image loading and display
 * - Physics simulation (gravity and jumping)
 * - Collision detection between rectangles
 * - Interactive mouse-based collision testing
 * - Game state management
 * 
 * Key concepts:
 * - PImage for sprite display
 * - Physics simulation with velocity
 * - Collision detection algorithms
 * - Boolean state tracking
 * 
 * Controls:
 * - Press SPACE to make the dinosaur jump
 * - Move mouse to test collision detection
 */

PImage dino; // Dinosaur sprite image
float dx, dy, dv, jumpspeed; // Dinosaur position (x,y), velocity, and jump speed
float ex, ey, es; // Enemy position (x,y) and speed
boolean currentlyJumping = false; // Track if dinosaur is currently jumping


void setup(){
  //fullScreen(); // Uncomment for fullscreen mode
  size(1200, 600); // Set canvas size to 1200x600 pixels
  dino = loadImage("dino.png"); // Load dinosaur sprite from data folder
  dino.resize(100, 0); // Resize dinosaur to 100 pixels wide, maintain aspect ratio
  dx = 25; // Initial dinosaur x-position
  dy = 500; // Initial dinosaur y-position (ground level)
  dv = 0; // Initial vertical velocity (not moving)
  jumpspeed = -4; // Jump velocity (negative for upward movement)
  ex = 1180; // Initial enemy x-position (right side of screen)
  ey = 550; // Enemy y-position (ground level)
  es = 5; // Enemy movement speed
  textSize(24); // Set text size for display
}

void draw(){
 background(225); // Light gray background
 
 // Draw dinosaur at current position
 image(dino, dx, dy);
 
 // Apply gravity/physics to dinosaur
 dy += dv; // Update dinosaur y-position with velocity
 
 // Bounce effect when dinosaur reaches top of screen
 if(dy < 300){
   dv = -dv; // Reverse velocity for bounce effect
 }
 
 // Reset dinosaur to ground when landing
 if(dy >= 500){
   dv = 0; // Stop vertical movement
   dy = 500; // Set to ground level
   currentlyJumping = false; // Allow jumping again
 }
 
 // Draw and move enemy
 rect(ex, ey, 50, 50); // Draw enemy as red rectangle
 ex -= es; // Move enemy left across screen
 
 // Interactive collision detection test with mouse
 if(rectRect(100, 100, 50, 50, mouseX, mouseY, 50, 50) == true){
   fill(255); // White fill if collision detected
 } else {
   fill(0); // Black fill if no collision
 }
 
 // Draw collision test rectangles
 rect(mouseX, mouseY, 50, 50); // Mouse-following rectangle
 rect(100, 100, 50, 50); // Static test rectangle
 
 
 
}

void keyPressed(){
  println(dino.height); // Debug: print dinosaur height
  if(key == ' ' && currentlyJumping == false){ // Space bar and not currently jumping
    dv = jumpspeed; // Set upward velocity for jump
    currentlyJumping = true; // Mark as currently jumping
  }
  
}
