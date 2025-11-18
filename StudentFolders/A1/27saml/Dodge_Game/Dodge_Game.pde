float x = 400;
float y = 575;
float r = 16;
color circlecolor = 255;
boolean collision = false;
boolean gameStarted = false;
boolean SettingsScreen = false;

boolean easyMode = false;
  color easycolor = 255;
boolean hardMode = false;
  color hardcolor = 255;
  
StartScreen startScreen = new StartScreen();
SettingsScreen settingsScreen = new SettingsScreen();
ArrayList<Purple> enemies = new ArrayList<Purple>();
ArrayList<Green> foes = new ArrayList<Green>();
int score = 0;
PFont arcade;

//This is helpful for making new buttons or screens:
//println("Mouse clicked at: " + mouseX + ", " + mouseY);
//Clickable buttons require the main sketch to call the classname.mousePressed(); in void mousePressed

import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();

void setup() {
  size (800, 600);
  //font setup
  arcade = createFont("ArcadeClassic", 48);
  textFont(arcade);
  for (int i = 0; i < 10; i++) {
    enemies.add(new Purple());
  }
  for (int i = 0; i < 10; i++) {
    foes.add(new Green());
  }
}
//reseting the game logic
void reset() {
  gameStarted = false;
  collision = false;
  SettingsScreen = false;
  setup();
  circlecolor = 255;
  fill(circlecolor);
  x = 400;
  y =575;
  r = 16;
  circle(x, y, r*2);
  score = 0;
}

void draw() {
  customPress();
  if (gameStarted == false) {
    startScreen.display();
    startScreen.mouseHover();
  } else {
    background(0);
    fill(circlecolor);
    circle(x, y, r*2);
    //score display
    textSize(15);
    textAlign(LEFT);
    text("Score  " + score, 10, 30);
    score++;
    if (foes.size() == 0 || enemies.size() == 0) {
      score = 0;
    } else {
      score++;
    }
    //easy mode logic
    if (easyMode == true) {
    easycolor = color(0, 255, 200);
    }

    //hard mode logic

    //constraining movement
    x = constrain(x, r*2, width-(r*2));
    y = constrain(y, r*2, height - r*2);

    //enemy purple
    for (int i = 0; i < enemies.size(); i++) {
      enemies.get(i).display();
      enemies.get(i).move();
      if (circleCircle(x, y, r, enemies.get(i).xpos, enemies.get(i).ypos, enemies.get(i).pr)) {
        collision = true;
        break;
      }
    }

    //foes green
    for (int i = 0; i < foes.size(); i++) {
      foes.get(i).display();
      foes.get(i).move();
      if (circleCircle(x, y, r, foes.get(i).xpos, foes.get(i).ypos, foes.get(i).gr)) {
        collision = true;
        break;
      }
      
    }
    //collision and reset logic
    if (collision == true) {
      delay(250);
      enemies.clear();
      foes.clear();
      r = (r * 0.6);
      circlecolor = color(255, 0, 0);
      if (r <= 0.1)
        reset();
    }
  }
}

void mousePressed() {
  if (gameStarted == false) {
    startScreen.mousePressed();
    settingsScreen.mousePressed();
    println("Mouse clicked at: " + mouseX + ", " + mouseY);
    //easy 210x 390x 210y 290y
    //hard 410x 590x 210y 290y
  }
}



void customPress() {
  if (keysDown.contains((int)'w') || keysDown.contains(UP)) {
    y = y-5;
  }
  if (keysDown.contains((int)'a') || keysDown.contains(LEFT)) {
    x = x-5;
  }
  if (keysDown.contains((int)'s') || keysDown.contains(DOWN)) {
    y = y+5;
  }
  if (keysDown.contains((int)'d') || keysDown.contains(RIGHT)) {
    x = x+5;
  }
  if (keysDown.contains((int)' ')) {
    gameStarted = true;
  }
}

void keyPressed() {
  if (key == CODED) {
    keysDown.add(keyCode);
  }else{
  keysDown.add((int)key);
}
}

void keyReleased() {
  if (key == CODED) {
    keysDown.remove(keyCode);
  }else{
  keysDown.remove((int)key);
}
}

boolean circleCircle(float cx1, float cy1, float cr1, float cx2, float cy2, float cr2) {
  if (dist(cx1, cy1, cx2, cy2) < cr1 + cr2) {
    return true;
  } else {
    return false;
  }
}
