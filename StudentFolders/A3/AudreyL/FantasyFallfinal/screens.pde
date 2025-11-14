String game = "gam";

void startScreen() {
  background(255);
  fill(0);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("FANTASY FALL", width/2, height/2 - 100); // Use width/2 and height/2
  textSize(30);
  text("Catch white balls (+1), avoid green balls (-1)", width/2, height/2 - 30);
  text("Press SPACE to read the story", width/2, height/2 + 40);
}

void gameScreen() {
}

void loreScreen() {
  background (0, 0, 100);
  fill (255);
  textSize(100);
  text( "The Legend of Emiline Caddock", CENTER, 50);
  textSize(30);
  text("A long long time ago...", CENTER, 70);
}
  
void gameOverScreen() {
  background(0, 0, 100);
  fill(255);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width/2, height/2 - 50);
  textSize(30);
  text("Final Score: " + score, width/2, height/2);
  text("Press R to restart", width/2, height/2 + 50);
}

void rewardScreen() {
  background(0, 0, 100);
  fill(255);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("CONGRATULATIONS, YOU HAVE EARNED 'JIMMY'", width/2, height/2 - 50);
  textSize(30);
  text("Press 'c' to claim", width/2, height/2); 
}
