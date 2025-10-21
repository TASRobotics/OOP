float x = 400;
float y = 300;
float speed = 1.5;
import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();

void setup() {
  size(800, 600);
}

void draw() {
  background(50); 
  circle(x, y, 50);
  customPress();
  wrapAround();
}

void customPress() {
  if (keysDown.contains(16)) { // Shift
    speed = 6.27;
  } else {
    speed = 1.5;
  }
  
  for (Integer k : keysDown) {
    if (k == 87) { // W
      y -= speed;
    }
    if (k == 68) { // D
      x += speed;
    }
    if (k == 83) { // S
      y += speed;
    }
    if (k == 65) { // A
      x -= speed;
    }
  }
}

void wrapAround() {
  float radius = 25;
  
 
  if (x - radius > width) {
    x = -radius;
  }

  if (x + radius < 0) {
    x = width + radius;
  }

  if (y - radius > height) {
    y = -radius;
  }

  if (y + radius < 0) {
    y = height + radius;
  }
}

void keyPressed(KeyEvent e) {
  keysDown.add(e.getKeyCode());
}

void keyReleased(KeyEvent e) {
  keysDown.remove(e.getKeyCode());
}

boolean keyDown(int kcode) {
  return keysDown.contains(kcode);
}
