float x = 400;
float y = 550;
float speed = 3;
int score;
int health = 100;
int lastSpawned = 0;
int spawnEvery = 50;
int lastShoot = 0;
int ShootEvery = 10;
boolean shooting = false;
boolean gameover = false;
ArrayList<RedEnemy> rr = new ArrayList<RedEnemy>();
ArrayList<GreenEnemy> gg = new ArrayList<GreenEnemy>();
import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();
ArrayList<Bullet> b = new ArrayList<Bullet>();

void setup() {
  //fullScreen();
  size(800, 600);
  frameRate(60);
}

void draw() {
  if (gameover == false) {
    main();
  } else {
    gameOver();
  }
}

void main() {
  background(50);
  fill(255);
  circle(x, y, 75);
  customPress();
  for (int i = 0; i < b.size(); i++) {
    Bullet r = b.get(i);
    r.shoot();
  }

  if (x < -23) {
    x = 823;
  }
  if (x > 823) {
    x = -23;
  }

  for (RedEnemy temp : rr) {
    temp.display();
    temp.update();
    if (temp.pos.y > 600) {
      health -= 5;
    }
  }
  for (GreenEnemy temp : gg) {
    temp.display();
    temp.update();
    if (temp.pos.y > 600) {
      health -= 5;
    }
  }
  if (frameCount >= lastSpawned + spawnEvery) {
    if (random(0, 1) < 0.5) {
      rr.add(new RedEnemy());
    } else {
      gg.add(new GreenEnemy());
    }
    lastSpawned = frameCount;
  }

  for (Bullet r : b) {
    for (RedEnemy temp : rr) {
      if (circleCircle(temp.pos.x, temp.pos.y, temp.dia / 2, r.x, r.y, 10)) {
        if (r.type == 0) {
          r.removeme = true;
          temp.removeme = true;
          score++;
        } else {
          r.removeme = true;
          score--;
        }
      }
    }
  }
  for (Bullet g : b) {
    for (GreenEnemy temp : gg) {
      if (circleCircle(temp.pos.x, temp.pos.y, temp.dia / 2, g.x, g.y, 10)) {
        if (g.type == 1) {
          g.removeme = true;
          temp.removeme = true;
          score++;
        } else {
          g.removeme = true;
          score--;
        }
      }
    }
  }

  for (int i = b.size() - 1; i >= 0; i--) {
    Bullet temp = b.get(i);
    if (temp.removeme) {
      b.remove(i);
    }
  }
   for (int i = rr.size() - 1; i >= 0; i--) {
    RedEnemy temp = rr.get(i);
    if (temp.removeme) {
      rr.remove(i);
    }
  }
   for (int i = gg.size() - 1; i >= 0; i--) {
    GreenEnemy temp = gg.get(i);
    if (temp.removeme) {
      gg.remove(i);
    }
  }
  fill(255);
  textSize(100);
  text(score, 50, 75);
}

void gameOver() {
  background (255, 0, 0);
}

void customPress() {
  println(score);
  for (Integer k : keysDown) {
    if (k == 68) { //d
      x += speed;
    }
    if (k == int('A')) {
      x -= speed;
    }
  }
}

void keyPressed(KeyEvent e) {
  keysDown.add(e.getKeyCode());
}

void keyReleased(KeyEvent e) {
  keysDown.remove(e.getKeyCode());
}

void mousePressed() {
  if (frameCount >= lastShoot + ShootEvery) {
    if (mouseButton == LEFT) {
      b.add(new Bullet(x, y, 0));
    }
    if (mouseButton == RIGHT) {
      b.add(new Bullet(x, y, 1));
    }
    lastShoot = frameCount;
  }
}

boolean keyDown(int kcode) {
  return keysDown.contains(kcode);
}
