float x = 400;
float bx = -10;
float by = -10;
float bs = 0;
float speed = 1.5;
boolean canShoot = true;
boolean isBulletRed = true;
boolean canSpawn = true;
int score = 0;

float enemyx;
float enemyy;

boolean isEnemyRed;
color c;
float speed;

int maxEnemies = 1;

ArrayList<Enemy> enemies = new ArrayList<Enemy>();

import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();

void setup() {
  //fullScreen();
  size(800, 600);
  enemies.add(new Enemy());
  //e = new Enemy();
  //e2 = new Enemy();
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

  if (score == 3 && enemies.size() <= maxEnemies) {
    maxEnemies = 2;
    enemies.add(new Enemy());
  }


  for (int i = 0; i < enemies.size(); i++) {
    Enemy temp = enemies.get(i);
    temp.moveanddraw();
    if (circleCircle(bx, by, 5, temp.x, temp.y, temp.d/2) == true) {
      bx = -1000;
      by = -1000;
      bs = 0;
      canShoot = true;
      if (isBulletRed == temp.isEnemyRed) {
        score+=1;
        temp.respawn();
      } else {
        score--;
        temp.speed++;
      }
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
