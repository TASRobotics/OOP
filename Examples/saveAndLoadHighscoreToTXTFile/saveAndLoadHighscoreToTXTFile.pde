// HIGH SCORE DEMONSTRATION PROGRAM
// Controls: Press SPACE to start playing (score increases with mouse X position)
// Press Z to return to high score display, Press R to reset high score to 0
// This demonstrates file I/O by saving/loading high scores to/from a text file
// The score is determined by your mouse X position while in play mode

int score = 0; // Current player score
int highscore = 0; // Best score achieved
int state = 0; // Game state: 0 = menu, 1 = playing

String hs; // String version of high score for file operations
String[] tosave = {""}; // Array to hold high score for saving
String[] toload; // Array to load high score from file
void setup() {
  //fullScreen();
  size(800, 600);
  textSize(30);
  toload = loadStrings("highscore.txt"); // Load high score from file
  highscore = int(toload[0]); // Convert first line to integer
}

void draw() {
  background(50); 
  hs = str(highscore); // Convert high score to string
  tosave[0] = hs; // Prepare high score for saving
  
  if (state == 0) { // Menu state - show high score
    text("HIGH SCORE: " + highscore, 50, 100);
    text("Press SPACE to play", 50, 150);
    text("Press R to reset high score", 50, 180);
  }
  
  if (state == 1) { // Playing state - show current score
    text("CURRENT SCORE: " + score, 50, 100);
    text("Move mouse right to increase score!", 50, 150);
    text("Press Z to return to menu", 50, 180);
    
    // Visual indicator of current score
    fill(255, 0, 0);
    rect(mouseX, height-50, 10, 10); // Red dot showing current position
    fill(255); // Reset to white
    
    score = mouseX; // Score equals mouse X position
    if (score >= highscore) { // Check if new high score achieved
      highscore = score; // Update high score
      saveStrings("highscore.txt", tosave); // Save to file
      text("NEW HIGH SCORE!", 50, 220); // Celebrate new high score
    }
  }
}

void keyPressed() {
  if (key == ' ') { // Space bar starts playing
    state = 1;
  }
  if (key == 'z') { // Z key returns to menu
    state = 0;
  }
  if (key == 'r') { // R key resets high score
    highscore = 0;
    hs = str(highscore);
    tosave[0] = hs;
    saveStrings("/data/highscore.txt", tosave); // Save reset high score
  }
}
