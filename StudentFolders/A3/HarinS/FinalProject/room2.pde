/*
 * Room 1 - Sword Collection Room with Border Constraints
 * 
 * This room demonstrates:
 * - Border collision detection
 * - Item collection mechanics
 * - Room transition logic
 * - Conditional item rendering
 * 
 * Player can only move left to return to room 0
 */

void screen2() {
  // Rectangle 1
  fill(255, 165, 0); // Bright Orange
  rect(150, 120, 180, 90); // x, y, width, height

  // Rectangle 2
  fill(75, 0, 130); // Indigo
  rect(350, 250, 140, 120);

  // Rectangle 3
  fill(0, 255, 255); // Cyan
  rect(500, 100, 200, 150);

  // Rectangle 4
  fill(255, 20, 147); // Deep Pink
  rect(600, 400, 160, 90);
  
  //leftbutton
  fill(255);
  rect(30, 285, 50, 25);
  triangle(20, 300, 50, 350, 50, 250);
  
  //rightbutton
  fill(255);
  rect(720, 285, 50, 25);
  triangle(780, 300, 750, 350, 750, 250);
  
  // Check for sword collection and render sword if not collected
  //checkIfPlayerIsTouchingSword(); // Check if player is touching the sword
  if(!playerHasKeyB){ // Only draw sword if player hasn't collected it
   drawKeyB(); // Draw sword on the floor
  }
}

//  //  playerHasSword = true; // Player has collected the sword
