String game = "game";
String screen = "circleCircle";
String screen1 = "start";
String screen2 = "lore";
String startandendscreen = "startandend";
String gameOverscreen;
String rewardScreen;
String gameScreen;
String loreScreen;

void startScreen() {
  image(actualstartscreen, 0, 0, width, height);
  imageMode(CENTER);
  PFont font;
  font = createFont("myfont.ttf", 15);
  textFont(font);
  fill(255);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("FANTASY FALL", width/2, height/2 - 100); // Use width/2 and height/2
  textSize(30);
  text("Welcome!", width/2 - 10, height/2 - 30);
  text("Press SPACE to begin", width/2, height/2 + 40);
}
void loreScreen() {
  image(lorescreenbg, 0, 0, width, height);
  imageMode(CENTER);
  image(scrollnobg, 565, 200, 200, 220);
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
  image(gameoverbackground, 0, 0, width, height);
  fill(255);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width/2, height/2 - 50);
  textSize(30);
  text("Final Score: " + score, width/2, height/2);
  if (score >= 15) {
    text("Press SPACE for reward!", width/2, height/2 + 50);
  }
}

void rewardScreen() {
  background(0);
  image(bernienobg, width/2 -100, height/2 -50, 200, 200);
  fill(255);
  textSize(30);
  textAlign(CENTER, CENTER);
  text("CONGRATULATIONS", width/2, 80);
  text("You have earned 'Bernie'", width/2, 120);
  text("Press 'c' to claim", width/2, height - 50);
}

void keyPressed() {
  println("Key pressed: " + key);
  //start screen to lore screen
  if (key == ' ' && screen1.equals("start")) {
    screen1 = "lore";
    println("Switching to lore screen");

    //lore screen to game, start timer
  } else if (key == ' ' && screen1.equals("lore")) {
    screen1 = "game"; 
    starttime = millis(); // start timer
    timerrunning = true;
    reset();
    println("Switching to game screen");
  } else if (key == ' ' && screen1.equals("game over")) {
    if (score >= 15) {
      screen1 = "reward";
      println("High score! Going to reward screen");
    } else {
      screen1 = "start";
      reset();
      println("Low score, going back to start");
    }

    //reward to start
  } else if (key == 'c' && screen1.equals("reward")) {
    screen1 = "start";
    reset();
    println("Claiming reward");
  } else if (key == 'r' || key == 'R') {
    if (screen1.equals("game over")) {
      screen1 = "start"; 
      reset();
      println("Restarting game");
    }
  }

  keysDown.add(keyCode);
}
