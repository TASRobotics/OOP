/*
 * Inventory Screen - Item Display System
 * 
 * This screen demonstrates:
 * - Conditional item display
 * - Text rendering
 * - State-based UI
 * 
 * Shows collected items to the player
 */

void inventory(){
  background(0); // Black background for inventory screen
  
  // Display sword if player has collected it
  if(playerHasSword){
    fill(255); // White text color
    textSize(50); // Large text size
    text("Sword", 100, 100); // Display "Sword" text
  }
}
