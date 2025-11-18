class SettingsScreen {
  float titleshapex = 400;
  float titleshapey = 150;
  float gamestartx = 550;
  float gamestarty = 500;
  float startscreenx = 250;
  float startscreeny = 500;
  color textcolor = 0;
  color backcolor = 255;
  color startcolor = 255;
  PFont arcade;
  //settings button variables
  float easyModex = 300;
  float easyModey = 250;
  float hardModex = 500;
  float hardModey = 250;

  void setup() {
    arcade = createFont("ArcadeClassic", 48);
    textFont(arcade);
  }

  void display() {
    //basic setup
    background(0);
    textAlign(CENTER, CENTER);
    fill(textcolor);
    //shape setup
    rectMode(CENTER);
    //title shape
    fill(255);
    rect(titleshapex, titleshapey, 400, 80, 88);
    fill(textcolor);
    textSize(32);
    text("Settings", titleshapex, titleshapey);
    //easy mode shape
    fill(easycolor);
    rect(easyModex, easyModey, 180, 80, 88);
    fill(textcolor);
    textSize(16);
    text("Easy Mode", easyModex, easyModey);
    //hard mode shape
    fill(hardcolor);
    rect(hardModex, hardModey, 180, 80, 88);
    fill(textcolor);
    textSize(16);
    text("Hard Mode", hardModex, hardModey);
    //start the game
    fill(startcolor);
    rect(gamestartx, gamestarty, 100, 80, 88);
    fill(textcolor);
    textSize(16);
    text("Start", gamestartx, gamestarty);
    //back to start screen
    fill(backcolor);
    rect(startscreenx, startscreeny, 100, 80, 88);
    fill(textcolor);
    textSize(16);
    text("Back", startscreenx, startscreeny);
  }

  void mouseHover() {
    //back button
    if (mouseX >= 200 && mouseX <= 300 && mouseY >= 460 && mouseY <= 540) {
      backcolor = color(0, 255, 200);
    } else {
      backcolor = 255;
    }
    //start button
    if (mouseX >= 500 && mouseX <= 600 && mouseY >= 460 && mouseY <= 540) {
      startcolor = color(100, 0, 255);
    } else {
      startcolor = 255;
    }
    //easy mode button
    if (mouseX >= 210 && mouseX <= 390 && mouseY >= 210 && mouseY <= 290) {
      easycolor = color(0, 255, 200);
    } else {
      if (easyMode) {
        easycolor = color(0, 255, 200); // keeps the button green permanently
      } else {
        easycolor = 255;
      }
    }
    //hard mode button
    if (mouseX >= 410 && mouseX <= 590 && mouseY >= 210 && mouseY <= 290) {
      hardcolor = color(255, 0, 0);
    } else {
      hardcolor = 255;
    }
  }
  void mousePressed() {
    //easy mode click logic (unfinished)
    if (mouseX >= 210 && mouseX <= 390 && mouseY >= 210 && mouseY <= 290) {
      easyMode = true;
    }
    //back button click logic
    if (mouseX >= 200 && mouseX <= 300 && mouseY >= 460 && mouseY <= 540) {
      gameStarted = false;
      SettingsScreen = false;
    }
    //start button click logic
    if (mouseX >= 500 && mouseX <= 600 && mouseY >= 460 && mouseY <= 540) {
      gameStarted = true;
    }
  }
}
