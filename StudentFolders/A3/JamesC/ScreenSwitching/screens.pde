void startScreen() {
  background(255);
  fill(0);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("press space to continue", 400, 300);
}

void gameScreen() {
  background(200);
  text(score, 400, 300);
  if (mouseX > 700 && mouseY > 500) {
    screen = "game over";
  }
}

void gameOverScreen() {
  background(255, 0, 0);
  fill(255);
  text("you died", 400, 300);
}


void reset(){
  score = 0;
}
