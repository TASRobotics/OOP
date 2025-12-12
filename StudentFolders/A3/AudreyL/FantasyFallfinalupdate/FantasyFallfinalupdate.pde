//speed, pos of player
float x = 400;
float y = 455;
float speed = 5;
//speed, pos of falling objects
float x2 = 40;
float y2 = 50;
float yspeed = 10;
float dia = 50;
int gametime = 61 * 1000; // 60 sec. timer
int starttime;
int timeleft; // time left
int score = 0;
boolean timerrunning = true; // if timer is running
boolean isballwhite = true;

import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();

void draw() {
  imageMode(CORNER);
  image(finalfantasy, 0, 0, width, height);
  //background(0);
  if (screen1.equals("start")) {
    startScreen();
    return;
  } else if (screen1.equals("lore")) {
    loreScreen();
    return;
  } else if (screen1.equals("game")) {
    gameScreen();
  } else if (screen1.equals("reward")) {
    rewardScreen();
    return;
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
      if (score >= 15) {
        screen1 = "reward";
      } else {
        screen1 = "game over";
      }
    }
  }

    fill(255);
    textSize(35);
    text((timeleft/1000) + "s", 50, 40);  //text will display as timeleft s (seconds)
    text("Score: " + score, width - 100, 40);
    //END OF TIMER CODE
    imageMode(CENTER);
    image(emilyimg, x, y, 100, 100);


    imageMode(CENTER);
    if (isballwhite) {
      image(armournobg, x2, y2, 100, 100);  // white circle --> armour
    } else {
      image(gargoylenobg, x2, y2, 80, 80);  // green cirlce --> gargoyle
    }
    customPress();
    if (x < 25) {
      x = 25;
    }
    if (x > width - 25) {
      x = width - 25; //so player does not go off screen
    }
    y2 =  y2 + yspeed;
    if (circleCircle(x, y, 60, x2, y2, 100) == true) {
      y2 = -40; //resets the falling ball to 40 pixels above the screen
      x2 = random(100, 700); //resets the falling ball so that its x pos is a random x in (100,700)
      if (isballwhite) {
        score += 1;  // +1 point for white balls
      } else {
        score -= 1;  // -1 point for green balls
      }
    }
    if (y2 >= 500) {
      y2 = -40;
      x2 = random (100, 700); //objects fall at yspeed and spawn at random x location between 100 and 700between 100 and 700
      float chance = random(100); //draw number from 0-100, if drawn number (represented by one falling object) is under 70, boolean isballwhite is true, ball fill white, same loogic for green
      if (chance < 65) {
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

  void reset() {
    score = 0;
    x = 400;
    y = 455;
    x2 = 40;
    y2 = 50;
    isballwhite = true;
    timerrunning = true;
    starttime = millis();

    println("New score: " + score);
    println("finished reset");
  }

  void keyReleased() {
    keysDown.remove(keyCode);
  }

  boolean keyDown(int kcode) {
    return keysDown.contains(kcode);
  }
