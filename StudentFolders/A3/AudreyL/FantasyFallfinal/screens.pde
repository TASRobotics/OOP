String game = "gam";

void startScreen() {
  background(255);
  PFont font;
  font = createFont("myfont.ttf", 15);
  textFont(font);
  fill(0);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("FANTASY FALL", width/2, height/2 - 100); // Use width/2 and height/2
  textSize(30);
  text("Press SPACE to read the story", width/2, height/2 + 40);
}
void loreScreen() {
  image(lorescreenbg, 0, 0, width, height);
  imageMode(CENTER);
  image(scrollnobg, 565, 200, 200, 220);
  //size(400, 400);
 
  textFont(font);
  fill (255);
  textSize(15);
  text( "Emiline ventures into the darkness.", 160, 20);
  text("follow the rules and you might just survive...", 600, 480);
  textSize(12);
  fill(0);
  text("Catch the gleaming", 565, 160);
  text("armour bright,", 565, 180);
  text("Flee the gargoyle's", 565, 210);
  text("stony might.", 565, 230);
}

void gameScreen() {

  image(finalfantasy, 0, 0);
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
