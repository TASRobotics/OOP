/*
 * Bad Adventure Game - Multi-Room Adventure with Inventory System
 * 
 * This sketch demonstrates:
 * - Multi-screen game navigation
 * - Player movement with WASD controls
 * - Room transitions and border constraints
 * - Item collection and inventory system
 * - Custom key handling with HashSet
 * 
 * Key concepts:
 * - Screen/room management with switch statements
 * - Player position tracking and movement
 * - Item interaction and state management
 * - Custom key press handling for smooth movement
 * 
 * Controls:
 * - Use WASD to move the character around
 * - Move east (right) to travel to the next room
 * - Move west (left) to return to the previous room
 * - Collect items by walking over them
 * - Press 'i' to open/close your inventory
 */

int screen = 0; // Current screen/room (0 = room 0, 1 = room 1, -1 = inventory)
int lastScreen; // Previous screen for inventory toggle
float x = 400; // Player x-coordinate
float y = 300; // Player y-coordinate
float speed = 4; // Player movement speed

boolean playerHasSword = false; // Track if player has collected the sword

import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>(); // Track currently pressed keys

void setup() {
  //fullScreen(); // Uncomment for fullscreen mode
  size(800, 600); // Set canvas size to 800x600 pixels
}

void draw() {
  background(50); // Dark gray background
  
  // Switch between different screens/rooms
  switch(screen) {
  case 0:
    screen0(); // Draw room 0
    break;
  case 1:
    screen1(); // Draw room 1
    break;
  case -1:
    inventory(); // Draw inventory screen
    break;
  default:
    break;
  }
  
  customPress(); // Handle player movement
  if(screen != -1){ // Only draw player if not in inventory
    drawPlayer();
  }
}

void drawPlayer() {
  fill(255); // White color for player
  circle(x, y, 50); // Draw player as white circle
}





void drawSwordOnFloor(){
   // Blade (long vertical rectangle)
  fill(200, 200, 200); // Light gray for the blade
  rect(40, 10, 20, 60); // x, y, width, height
  
  // Guard (horizontal rectangle at the top of the blade)
  fill(150, 75, 0); // Brown for the guard
  rect(30, 10, 40, 5); // x, y, width, height
  
  // Handle (short vertical rectangle)
  fill(139, 69, 19); // Dark brown for the handle
  rect(45, 70, 10, 25); // x, y, width, height
  
  // Pommel (circle at the bottom of the handle)
  fill(150, 75, 0); // Brown for the pommel
  ellipse(50, 95, 15, 15); // x, y, width, height
}

void customPress() {
  // Handle continuous key presses for smooth movement
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

void keyPressed(KeyEvent e) {
  println(e.getKeyCode()); // Debug: print key code
  keysDown.add(e.getKeyCode()); // Add key to pressed keys set
  
  if(key == 'i'){ // Toggle inventory with 'i' key
      if(screen != -1){ // If not in inventory, go to inventory
        lastScreen = screen; // Remember current screen
        screen = -1; // Switch to inventory
      } else { // If in inventory, return to previous screen
        screen = lastScreen; 
      }
    }
  
}

void keyReleased(KeyEvent e) {
  keysDown.remove(e.getKeyCode()); // Remove key from pressed keys set
}

boolean keyDown(int kcode) {
  return keysDown.contains(kcode); // Check if specific key is currently pressed
}
