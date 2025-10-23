float x = 400;

float bx = -10;
float by = -10;
float bs = 0;

float speed = 1.5;

boolean canShoot = true;

import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();

void setup() {
  //fullScreen();
  size(800, 600);
}

void draw() {
  background(50);
  circle(bx, by, 10);
  circle(x, 550, 50);
  customPress();
  
  by += bs;
  
}

void customPress() {
  if (keysDown.contains(16)) { //shift
    speed = 6.27;
  } else {
    speed = 1.5;
  }
  for (Integer k : keysDown) {
    if (k == 'D') { //d
      x += speed;
    }
    if (k == int('A')) {
      x -= speed;
    }
    if(k == ' ' && canShoot == true){
      bx = x;
      by = 550;
      bs = -8;
      canShoot = false;
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
