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
  int moveEvery = 3;
  int lastMoved = millis();
  // Rectangle 1
  fill(230, 165, 0); // Bright Orange
  rect(200, 400, 180, 90); // x, y, width, height

  // Rectangle 2
  fill(0, 200, 130); // Indigo
  rect(300, 100, 200, 100);

  // Rectangle 3
  fill(150, 0, 30); // Cyan
  rect(600, 200, 150, 230);

  // Rectangle 4
  fill(0, 80, 147); // Deep Pink
  rect(100, 120, 160, 90);

  // Check for sword collection and render sword if not collected
  //checkIfPlayerIsTouchingSword(); // Check if player is touching the sword
  if (!playerHasKeyB) { // Only draw key if player hasn't collected it
    drawKeyB();
    if (millis() >= lastMoved + moveEvery) {
      keybx = int(random (50, 700));
      keyby = int(random (50, 500));
      lastMoved = millis();
    }
  }
}

//  //  playerHasSword = true; // Player has collected the sword
