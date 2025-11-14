//speed, pos of player
float x = 400;
float y = 575;
float speed = 5;
//speed, pos of falling objects
float x2 = 40;
float y2 = 50;
float yspeed = 10;
float dia = 50;
int gametime = 61 * 1000; // 60 second timer
int starttime;
int timeleft; // time left
int score = 0;
boolean timerrunning = true; // if timer is running
String screen = "circleCircle";
String screen1 = "start";
String screen2 = "lore";
String startandendscreen = "startandend";
String gameOverscreen;
String rewardScreen;
String gameScreen;
String loreScreen;
boolean isballwhite = true;

import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();

void setup() {
  //fullScreen();
  size(800, 600);
  starttime = millis();
  size(800, 600);
  game = game + "e";
  println(game);
}

void draw() {
  background(50);
  if (screen1.equals("start")) {
    startScreen();
    return;
  } else if (screen1.equals("game")) {
    gameScreen();
  } else if (screen1.equals("game over")) {
    gameOverScreen();
    return;
  }

  //TIMER CODE
  if (timerrunning) {
    timeleft = gametime - (millis() - starttime); //total game time (60 seconds) - millis() (total time that has passed since game started - starttime (time when timer starts)
    // check if time is up
    if (timeleft <= 0) { //if timeleft is equal or less than 0
      timeleft = 0; //set to 0
      timerrunning = false; //stop timer
      screen1 = "game over";
    }
  }
  fill(255);
  textSize(35);
  text((timeleft/1000) + "s", 40, 40);  //text will display as timeleft s (for seconds)
  text("Score: " + score, width - 80, 40);   // Below the timer
  //END OF TIMER CODE


  fill(255); // default falling circle colour = white
  circle(x, y, 50); //player
  if (isballwhite) {
    fill(255); // if isballwhite is true, fill white
  } else {
    fill(0, 255, 0); // if isballwhite is false, fill green
  }
  circle(x2, y2, 50); //falling object
  customPress();
  if (x < 25) {
    x = 25;
  }
  if (x > width - 25) {
    x = width - 25; //so player does not go off screen
  }
  y2 =  y2 + yspeed;
  if (circleCircle(x, y, 50, x2, y2, 50) == true) {
    y2 = -40; //resets the falling ball to 40 pixels above the screen
    x2 = random(100, 700); //resets the falling ball so that its x pos is a random x in (100,700)
    if (isballwhite) {
      score += 1;  // +1 point for white balls
    } else {
      score -= 1;  // -1 point for green balls
    }
    float chance = random(100); //draw number from 0-100, if drawn number (represented by one falling object) is under 70, boolean isballwhite is true, ball fill white, same loogic for green
    if (chance < 70) {
      isballwhite = true; // 70% chance
    } else {
      isballwhite = false; // 30% chance
      //chance applies before you miss a falling object
    }
  }
  if ( y2 >= 600) {
    y2 = -40;
    x2 = random (100, 700); //objects fall at yspeed and spawn at random x location between 100 and 700between 100 and 700
    float chance = random(100); //draw number from 0-100, if drawn number (represented by one falling object) is under 70, boolean isballwhite is true, ball fill white, same loogic for green
    if (chance < 70) {
      isballwhite = true; // 70% chance
    } else {
      isballwhite = false; // 30% chance
      //chance still applies even after you miss a falling object
    }
  }
}

void customPress() {
  for (Integer k : keysDown) {
    if (k == 68) { // 'D' key code
      x += speed;
    }
    if (k == 65) { // 'A' key code
      x -= speed;
    }
  }
}

void keyPressed() {
  println("Key pressed: " + key);

  // Screen switching
  if (key == ' ' && screen1.equals("start")) {
    screen1 = "lore"; // Switch to game
    println("Switching to lore screen");
  }
  if (key == 's' && screen.equals("lore")) {
    screen2 = "game";
    starttime = millis();
    timerrunning = true;
    println("Switching to game screen");
  }
  if (key == 'r' || key == 'R') {
    if (screen1.equals("game over")) {
      screen1 = "start"; // Switch back to start
      reset();
      println("Restarting game");
    }
  }

  keysDown.add(keyCode);
}

void reset() {
  score = 0;
  x = 400;
  y = 575;
  x2 = 40;
  y2 = 50;
  isballwhite = true;
  timerrunning = true;
  starttime = millis();
}

void keyReleased() {
  keysDown.remove(keyCode);
}

boolean keyDown(int kcode) {
  return keysDown.contains(kcode);
}
