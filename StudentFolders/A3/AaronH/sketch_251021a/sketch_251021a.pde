float x = 400;  
float y = 575;  
float speed = 4;
float bulletX = -10;   
float bulletY = -10;   
boolean bulletFired = false;

import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();

void setup() {
  size(800, 600);
}

void draw() {
  background(50);
  customPress();

 
  circle(x, y, 50);


  if (bulletFired) {
    bulletY -= 10;
    circle(bulletX, bulletY, 10);
    if (bulletY < 0) {
      bulletFired = false;
    }
  }
}

void customPress() {
  if (keysDown.contains(16)) { 
    speed = 8;
  } else {
    speed = 4;
  }

  if (keysDown.contains(65)) { 
    x -= speed;
  }
  if (keysDown.contains(68)) { 
    x += speed;
  }

  if (x < 25) x = 25;
  if (x > 775) x = 775;
}

void keyPressed(KeyEvent e) {
  keysDown.add(e.getKeyCode());


  if (e.getKeyCode() == 32 && !bulletFired) {
    bulletFired = true;
    bulletX = x; 
    bulletY = y - 25;
  }
}

void keyReleased(KeyEvent e) {
  keysDown.remove(e.getKeyCode());
}

boolean keyDown(int kcode) {
  return keysDown.contains(kcode);
}
