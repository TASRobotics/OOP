/*
 * FlashBang - Interactive Bomb Throwing Game
 * 
 * This sketch demonstrates an advanced game with multiple systems:
 * - Player character controlled with WASD keys (with running via Shift)
 * - Bomb placement system with left-click (flash bombs) and right-click (damage grenades)
 * - Health system with visual feedback
 * - Screen flash effect when hit by flash bombs
 * - Advanced input handling supporting multiple simultaneous key presses
 * - Object-oriented programming with inheritance (Grenade extends Bomb)
 * - Comprehensive collision detection system
 * 
 * Key concepts demonstrated:
 * - HashSet for efficient key state tracking
 * - ArrayList management with proper cleanup
 * - Game state management (health, blindness effects)
 * - Class inheritance and polymorphism
 * - Mathematical collision detection algorithms
 * - Visual effects and screen overlays
 */

// Player position coordinates
float x = 400;
float y = 300;

// Base movement speed (multiplied by speedmultiplier)
float speed = 1.5;

// Import HashSet for efficient key tracking
import java.util.HashSet;

// Track all currently pressed keys for smooth multi-directional movement
HashSet<Integer> keysDown = new HashSet<Integer>();

// ArrayList to store all active bombs and grenades on screen
ArrayList<Bomb> bombs = new ArrayList<Bomb>();

// Screen flash effect state variables
boolean playerBlind = false;  // Whether player is currently blinded
int blindCountdown = 400;     // Frames remaining for flash effect

// Player health system
float playerHealth = 100;     // Current health points (0-100)
float speedmultiplier = 1.0;  // Global speed modifier for all movement

void setup() {
  //fullScreen(); // Uncomment for fullscreen mode
  size(800, 600); // Set canvas size to 800x600 pixels
  
  // Add an initial bomb to demonstrate the game
  bombs.add(new Bomb(600, 400));
}

void draw() {
  background(50); // Dark gray background
  
  // Clean up exploded bombs from the ArrayList (iterate backwards to avoid index issues)
  for (int i = bombs.size()-1; i >= 0; i--) {
    Bomb b = bombs.get(i);
    if (b.exploded == true) {
      bombs.remove(b); // Remove bomb if it has finished exploding
    }
  }
  
  // Update and display all active bombs
  for (Bomb b : bombs) {
    b.display();        // Draw the bomb/grenade
    b.logic(x, y);      // Update bomb logic and check for player collision
  }

  // Draw the player as a white circle
  fill(255);
  circle(x, y, 50);
  
  // Handle player movement based on currently pressed keys
  customPress();

  // Handle screen flash effect when player is blinded
  if (playerBlind) {
    // Calculate flash opacity (starts at 255, fades to 0)
    int opacity;
    if (blindCountdown > 255) {
      opacity = 255; // Maximum opacity for first few frames
    } else {
      opacity = blindCountdown; // Fade out over time
    }
    println(opacity); // Debug output for flash intensity
    
    // Draw white overlay with calculated opacity
    fill(255, opacity);
    rect(0, 0, width, height);
    
    // Decrease countdown and reset when finished
    blindCountdown--;
    if (blindCountdown == 0) {
      playerBlind = false;      // End flash effect
      blindCountdown = 400;     // Reset for next flash
    }
  }
  
  // Display current health in top-left corner
  textSize(40);
  text((int)playerHealth, 50, 50);
}

// Custom movement system supporting multiple simultaneous key presses
void customPress() {
  // Check if shift is held for running speed
  if (keysDown.contains(16)) { // Shift key code
    speed = 6.27*speedmultiplier; // Fast running speed
  } else {
    speed = 1.5*speedmultiplier;  // Normal walking speed
  }
  
  // Process all currently pressed keys for movement
  for (Integer k : keysDown) {
    if (k == 87) { // W key - move up
      y -= speed;
    }
    if (k == 68) { // D key - move right
      x += speed;
    }
    if (k == int('S')) { // S key - move down
      y += speed;
    }
    if (k == int('A')) { // A key - move left
      x -= speed;
    }
  }
}

// Add key to the set of currently pressed keys
void keyPressed(KeyEvent e) {
  println(e.getKeyCode()); // Debug output for key codes
  keysDown.add(e.getKeyCode());
}

// Remove key from the set when released
void keyReleased(KeyEvent e) {
  keysDown.remove(e.getKeyCode());
}

// Utility function to check if a specific key is currently pressed
boolean keyDown(int kcode) {
  return keysDown.contains(kcode);
}

// Handle mouse clicks for bomb placement
void mousePressed() {
  if (mouseButton == LEFT) {
    // Left click: place a flash bomb (blinds player)
    bombs.add(new Bomb(mouseX, mouseY));
  } else {
    // Right click: place a damage grenade (reduces health)
    bombs.add(new Grenade(mouseX, mouseY));
  }
}
