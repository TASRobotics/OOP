float x = 400;
float bx = -10;
float by = -10;
float bs = 0;
float speed = 1.5;
boolean canShoot = true;
boolean isBulletRed = true;

int score = 0;

Enemy e;
Enemy e2;

import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();

void setup() {
  //fullScreen();
  size(800, 600);
  e = new Enemy();
  e2 = new Enemy();
  textSize(40);
}

void draw() {
  background(50);
  fill(255);
  text(score, 50, 50);
  if (isBulletRed == true) {
    fill(255, 0, 0);
  } else {
    fill(0, 255, 0);
  }
  circle(bx, by, 10);

  fill(0, 0, 255);
  circle(x, 550, 50);

  customPress();
  x = constrain(x, 50, 750);
  by += bs;

  if (by < 0) {
    canShoot = true;
  }
  e.moveanddraw();
  e2.moveanddraw();


  if (circleCircle(bx, by, 5, e.x, e.y, e.d/2) == true) {
    if (isBulletRed == e.isEnemyRed) {
      score++;
      bx = -1000;
      by = -1000;
      bs = 0;
      canShoot = true;
      e = new Enemy();
    } else {
      score--;
      bx = -1000;
      by = -1000;
      bs = 0;
      canShoot = true;
      e.speed++;
    }
  }
  if (circleCircle(bx, by, 5, e2.x, e2.y, e2.d/2) == true) {
    if (isBulletRed == e2.isEnemyRed) {
      score++;
      bx = -1000;
      by = -1000;
      bs = 0;
      canShoot = true;
      e2 = new Enemy();
    } else {
      score--;
      bx = -1000;
      by = -1000;
      bs = 0;
      canShoot = true;
      e2.speed++;
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
    if (k == 'D') { //d
      x += speed;
    }
    if (k == int('A')) {
      x -= speed;
    }
    if (k == '1' && canShoot == true) {
      bx = x;
      by = 550;
      bs = -8;
      canShoot = false;
      isBulletRed = true;
    }
    if (k == '2' && canShoot == true) {
      bx = x;
      by = 550;
      bs = -8;
      canShoot = false;
      isBulletRed = false;
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
