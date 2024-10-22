float playerX = 50;
float playerY = 300;
//int[] nums = new int[100];
//Bullet[] ammo = new Bullet[100];
ArrayList<Bullet> ammo = new ArrayList<Bullet>(); //we dont need the 100 because arraylist can be any size
boolean poweredup = false;
ArrayList<Enemy> wuw = new ArrayList<Enemy>();
int score = 0;
Enemy austin;






void setup() {
  size(800, 600);
  wuw.add(new Enemy(700, random(100, 500)));
}



void draw() {
  background(50);
  circle(playerX, playerY, 50);
  textSize(60);
  text(score, 750, 50);
  //go through all bullets and update position / draw them
  for (int i = 0; i < ammo.size(); i++) {

    Bullet b = ammo.get(i);
    b.pewpew();
  }

  for (int i = 0; i < wuw.size(); i++) {
    Enemy e = wuw.get(i);
    e.walk();
    if (e.health <= 0) {
      score++;
      e.x = -1000;
      e.y = -1000;
      e.cx = -1000;
      e.health = 1;
    }
  }

  if (frameCount % 60 == 0) {
    wuw.add(new Enemy(700, random(100, 500)));
  }

  for (Bullet b : ammo) {
    for (Enemy e : wuw) {
      if (circleCircle(e.x, e.y, e.size / 2, b.x, b.y, 10)) {
        e.health-= 10;
        b.x = -100;
        b.y = -100;
        b.cx = 0;
      }
    }
  }
}

void keyPressed() {
  if (key == 'w') {
    playerY -= 10;
  }
  if (key == 's') {
    playerY += 10;
  }
  if (key == 'a') {
    playerX -= 10;
  }
  if (key == 'd') {
    playerX += 10;
  }

  if (key == ' ') {
    //spawn a new bullet, prepare to go to next bullet
    if (poweredup == false) {
      ammo.add(new Bullet(playerX, playerY));
      println(ammo.size());
    } else if (poweredup == true) {
      ammo.add(new Bullet(playerX, playerY));
      ammo.add(new Bullet(playerX, playerY, 0.75));
      ammo.add(new Bullet(playerX, playerY, -0.75));
    }
  }
}
