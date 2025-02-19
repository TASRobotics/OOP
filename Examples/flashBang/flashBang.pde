float x = 400;
float y = 300;
float speed = 1.5;
import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();
ArrayList<Bomb> bombs = new ArrayList<Bomb>();
boolean playerBlind = false;
int blindCountdown = 400;

void setup() {
  //fullScreen();
  size(800, 600);
  bombs.add(new Bomb(600, 400));
}

void draw() {
  background(50);


  for (Bomb b : bombs) {
    b.display();
    b.logic(x, y);
  }
  for (int i = bombs.size()-1; i >= 0; i--) {
    Bomb b = bombs.get(i);
    if (b.exploded == true) {
      bombs.remove(b);
    }
  }


  fill(255);
  circle(x, y, 50);
  customPress();

  if (playerBlind) {
    int opacity;
    if(blindCountdown > 255){
      opacity = 255;
    } else {
      opacity = blindCountdown;
    }
    println(opacity);
    fill(255, opacity);
    rect(0, 0, width, height);
    blindCountdown--;
    if (blindCountdown == 0) {
      playerBlind = false;
      blindCountdown = 400;
    }
  }
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

void mousePressed() {
  bombs.add(new Bomb(mouseX, mouseY));
}
