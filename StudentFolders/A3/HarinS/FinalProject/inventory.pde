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
  if(playerHasKeyR){
    fill(255, 0, 0);
    textSize(50);
    text("Red Key", 100, 100);
  }
  if(playerHasKeyB){
    fill(0, 0, 255);
    textSize(50);
    text("Blue Key", 100, 200);
  }
  if(playerHasKeyG){
    fill(0, 255, 0);
    textSize(50);
    text("Green Key", 100, 300);
  }
  if(playerHasPWG){
    fill(0, 255, 0);
    textSize(50);
    text(str(password1), 100, 400);
    text(str(password2), 120, 400);
    text(str(password3), 140, 400);
    text(str(password4), 160, 400);
  }
}
