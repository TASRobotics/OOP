float playerX = 50;
float playerY = 300;
//int[] nums = new int[100];
//Bullet[] ammo = new Bullet[100];
ArrayList<Bullet> ammo = new ArrayList<Bullet>(); //we dont need the 100 because arraylist can be any size
ArrayList<Enemy> foes = new ArrayList<Enemy>();
boolean poweredup = true;



void setup() {
  size(800, 600);
}



void draw() {
  background(50);
  circle(playerX, playerY, 50);
  
  if(frameCount % 90 == 0){
    foes.add(new Enemy(800, random(100, 500)));
  }


  //go through all bullets and update position / draw them
  for (int i = 0; i < ammo.size(); i++) {
    //Bullet b = ammo[i];
    Bullet b = ammo.get(i);
    b.pewpew();
  }

  for (Enemy e : foes) {
    e.walk();
  }

  for (Bullet b : ammo) {
    for (Enemy e : foes) {
      if (circleCircle(b.x, b.y, 20, e.x, e.y, e.size/2)) {
        e.health -= 10;
        b.y = -1000;
        if (e.health <= 0) {
          e.y = -2000;
          e.cx = 0;
        }
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
