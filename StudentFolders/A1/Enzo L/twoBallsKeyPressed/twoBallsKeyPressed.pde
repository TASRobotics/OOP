float x = 400;
float y = 300;
float x2 = 300;
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
}

void customPress() {
  if (keysDown.contains(16)) { //shift
    speed = 6.27;
  } else {
    speed = 1.5;
  }
  for (Integer k : keysDown) {
    if (k == 87) { //w
      y -= speed;
    }
    if (k == 68) { //d
      x += speed;
    }
    if (k == int('S')) {
      y += speed;
    }
    if (k == int('A')) {
      x -= speed;
    }
    if (k == 38) { //W
      y2 -= speed;
    }
    if (k == 39) { //D
      x2 +=speed;
    }
    if (k == 40) { //S
      y2 +=speed;
    }
    if (k == 37) { //A
      x2 -=speed;
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
