float playerX = 50;
float playerY = 300;
//int fireSpeed = 15;
//int lastFired = -15;
int numBullets = 10;

//make bullet arrays
float[] x = new float[numBullets];
float[] y = new float[numBullets];
float[] cx = new float[numBullets];
//which bullet to fire (index)
int bulletToFire = 0;

void setup() {
  //fullScreen();
  size(800, 600);
}

void draw() {
  background(50);
  circle(playerX, playerY, 50);
  //go through all bullets and update position / draw them
  for (int i = 0; i < numBullets; i++) {
    circle(x[i], y[i], 20);
    x[i] += cx[i];
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
      x[bulletToFire] = playerX;
      y[bulletToFire] = playerY;
      cx[bulletToFire] = 10;
      bulletToFire++;
       
  }
}
