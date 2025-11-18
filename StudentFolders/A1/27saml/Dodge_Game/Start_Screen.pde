class StartScreen {
  float startshapex = 400;
  float startshapey = 300;
  float titleshapex = 400;
  float titleshapey = 150;
  float settingshapex = 400;
  float settingshapey = 450;
  color textcolor = 0;
  color boxcolor1 = 255;
  color boxcolor2 = 255;
  PFont arcade;


  void setup() {
    arcade = createFont("ArcadeClassic", 48);
    textFont(arcade);
  }

  void display() {
    //basic setup
    background(0);
    textAlign(CENTER, CENTER);
    fill(textcolor);
    //shape setup:
    rectMode(CENTER);
    //title shape
    fill(255);
    rect(titleshapex, titleshapey, 400, 80, 88);
    fill(textcolor);
    textSize(32);
    text("Dodge Game", titleshapex, titleshapey);
    //start shape
    fill(boxcolor1);
    rect(startshapex, startshapey, 200, 88, 88);
    fill(textcolor);
    textSize(32);
    text("Start", startshapex, startshapey);
    //settings shape
    fill(boxcolor2);
    rect(settingshapex, settingshapey, 200, 88, 88);
    fill(textcolor);
    textSize(32);
    text("Settings", settingshapex, settingshapey);
    
    if (SettingsScreen == true) {
    settingsScreen.display();
    settingsScreen.mouseHover();
  }
  }

  void mouseHover() {
    if (mouseX >= 300 && mouseX <= 500 && mouseY >= 260 && mouseY <= 340) {
      boxcolor1 = color(0, 255, 200);
    }else{
      boxcolor1 = 255;
    }
    if (mouseX >= 300 && mouseX <= 500 && mouseY >= 410 && mouseY <= 490) {
      boxcolor2 = color(100, 0, 255);
    }else{
      boxcolor2 = 255;
    }
  }
  
  void mousePressed(){
    if (mouseX >= 300 && mouseX <= 500 && mouseY >= 260 && mouseY <= 340) {
       gameStarted = true;
       //don't remove this code it eliminates a bug in the settings screen
       if (SettingsScreen == true){
         gameStarted = false;
       }
    }
    if (mouseX >= 300 && mouseX <= 500 && mouseY >= 410 && mouseY <= 490) {
      SettingsScreen = true;
    }
  }
}
