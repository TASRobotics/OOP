float x = 400;
float y = 300;
float x1 = 200;
float y1 = 300;
float speed = 1.5;
float speed1 = 1.5;
import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();

void setup() {
  //fullScreen();
  size(800, 600);
}

void draw() {
  background(50); 
  fill(255,0,0);
  circle(x, y, 50);
  fill(0,0,255);
  circle(x1,y1,50);
  customPress();
  if (x < -23){
    x = 823;
  }
  if (x > 823){
    x = -23;
  }
  if (y < -23){
    y = 623;
  }
  if (y > 623){
    y = -23;
  }
  if (x1 < -23){
    x1 = 823;
  }
  if (x1 > 823){
    x1 = -23;
  }
  if (y1 <= -23){
    y1 = 623;
  }
  if (y1 > 623){
    y1 = -23;
  }
}

void customPress() {
  if(keysDown.contains(16)){ //shift
    speed = 6.27;
  } else {
    speed = 1.5;
  }
  if(keysDown.contains(32)){ //space
    speed1 = 6.27;
  } else {
    speed1 = 1.5;
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
    if (k == 37) { //left
      x1 -= speed1;
    }
    if (k == 39) { //right
      x1 += speed1;
    }
    if (k == 38) { //up
      y1 -= speed1;
    }
    if (k == 40) { //d
      y1 += speed1;
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

boolean keyDown(int kcode){
  return keysDown.contains(kcode);
}
