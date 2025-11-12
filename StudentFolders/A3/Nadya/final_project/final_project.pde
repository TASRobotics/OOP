PImage frogImg;
float frogW = 100;
float frogH = 150;
float spacing = 50;
float frogY = 450;
float velocityY = 0;
float gravity = 0.5;
Platform[] platforms = new Platform[10];
int numPlatforms = 10;
boolean jumping = false;
boolean gameover = false;

void setup() {
  size(400, 600);
  frogImg = loadImage("froggie-removebg-preview.png");
  for (int i = 0; i < numPlatforms; i++ ) {
    fill(#F8FA8D);
    platforms[i] = new Platform();
    platforms[i].x = random(50, 250);
    platforms[i].y = height - i * spacing;
  }
}

void draw() {
  background(#A2ECFF);
  image(frogImg, 150, frogY, frogW, frogH);
  for (int i = 0; i < numPlatforms; i++ ) {
    platforms[i].display();
  }
  if (frogY >= height - frogH) {
    frogY = height - frogH;
    velocityY = 0;
    jumping = false;
  }
  velocityY += gravity;
  frogY += velocityY;
  //println(mouseX, mouseY);
}

void keyPressed() {
  if (key == ' ' && !jumping) {
    jumping = true;
    velocityY = -12;
  }
}
