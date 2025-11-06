//speed, pos of player
float x = 400;
float y = 575;
float speed = 5;
//speed, pos of falling objects
float x2 = 40;
float y2 = 50;
float yspeed = 3;

import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();

void setup() {
  //fullScreen();
  size(800, 600);
}

void draw() {
  background(50);
  circle(x, y, 50); //player
  circle(x2, y2, 50); //falling object
  customPress();
  if (x < 25) {
    x = 25;
  }
  if (x > width - 25) {
    x = width - 25; //so player does not go off screen
  }
  y2 =  y2 + yspeed;
  if ( y2 >= 600) {
    y2 = -40;
    x2 = random (100, 700); //objects fall at yspeed and spawn at random x location between 100 and 700
  }
}

void customPress() {
  for (Integer k : keysDown) {
    if (k == 68) { //daa
      x += speed;
    }
    if (k == int('A')) {
      x -= speed; //controlling player movement using keys A and D
    }
  }
}

void keyPressed(KeyEvent e) {
  println(e.getKeyCode());
  keysDown.add(e.getKeyCode());
}

void keyReleased(KeyEvent e) {
  keysDown.remove(e.getKeyCode());
}

boolean keyDown(int kcode) {
  return keysDown.contains(kcode);
}
