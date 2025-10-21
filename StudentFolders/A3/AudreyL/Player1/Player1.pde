float x = 400;
float y = 300;
float x2 = 500;
float y2 = 400;
float speed = 1.5;
import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();

void setup() {
  //fullScreen();
  size(800, 600);
}

void draw() {
  background(50);
  circle(x, y, 50);
  circle(x2, y2, 50);
  customPress();

  if (x > width) {
    x = 0;  // go off right --> come back from left
  }
  if (x < 0) {
    x = width;  // go off left --> come back from right
  }
  if (y > height) {
    y = 0;  // go off bottom --> come back from top
  }
  if (y < 0) {
    y = height;  // go off top --> come back from bottom
  }
  if (x2 > width) {
    x2 = 0;  // second ball go off right --> come back from left
  }
  if (x2 < 0) {
    x2 = width;  // second ball go off left --> come back from right
  }
  if (y2 > height) {
    y = 0;  // second ball go off bottom --> come back from top
  }
  if (y2 < 0) {
    y = height;  // second ball go off top --> come back from bottom
  }
}


void customPress() {
  if (keysDown.contains(16)) { //shift
    speed = 6.27; //if pressed shift, speed of ball will increase to 6.27
  } else {
    speed = 1.5; //otherwise its baseline speed is just 1.5
  }
  for (Integer k : keysDown) {
    if (k == 87) { //w
      y -= speed;
    }
    if (k == 68) { //daa
      x += speed;
    }
    if (k == int('S')) {
      y += speed;
    }
    if (k == int('A')) {
      x -= speed;
    }
    if (k == 37) { //left arrow button
      x -= speed;
    }
    if (k == 38) { //up arrow button
      y -= speed;
    }
    if (k == 39) { //right arrow button
      x += speed;
    }
    if (k == 40) { //down arrow button
      y += speed;
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
