PImage frogImg;
float frogW = 67;
float frogH =90;
float frogX;
float frogY;
float velocityY = 0;
float gravity = 0.5;

Platform[] platforms;
int numPlatforms = 10;
float spacing = 120;

boolean moveLeft = false;
boolean moveRight = false;
boolean jumping = false;
boolean gameOver = false;

int score = 0;

void setup() {
  size(400, 600);
  frogImg = loadImage("froggie-removebg-preview.png");

  platforms = new Platform[numPlatforms];

  for (int i = 0; i < numPlatforms; i++) {
    platforms[i] = new Platform();
    platforms[i].x = random(50, width - 100);
    platforms[i].y = height - 150 - i * spacing;
    platforms[i].landed = false;
  }

  frogX = platforms[0].x + 10;
  frogY = platforms[0].y - frogH;
}

void draw() {
  background(#A2ECFF);

  if (!gameOver) {
    velocityY += gravity;
    frogY += velocityY;

    if (moveLeft) frogX -= 5;
    if (moveRight) frogX += 5;
    frogX = constrain(frogX, 0, width - frogW);

    jumping = true;

    for (int i = 0; i < numPlatforms; i++) {
      platforms[i].display();

      if (velocityY > 0 &&
        frogX + frogW > platforms[i].x &&
        frogX < platforms[i].x + platforms[i].w &&
        frogY + frogH >= platforms[i].y &&
        frogY + frogH <= platforms[i].y + platforms[i].h  ) {

        frogY = platforms[i].y - frogH;
        velocityY = -12;
        jumping = false;

        if (!platforms[i].landed) {
          score++;
          platforms[i].landed = true;
        }
      }

      if (platforms[i].y > height) {
        platforms[i].y = 0;
        platforms[i].x = random(50, width - 100);
        platforms[i].landed = false;
      }
    }

    if (frogY < height / 2) {
      float diff = height / 2 - frogY;
      frogY = height / 2;

      for (int i = 0; i < numPlatforms; i++) {
        platforms[i].y += diff;
      }
    }

    image(frogImg, frogX, frogY, frogW, frogH);

    fill(0);
    textSize(20);
    text("Score: " + score, 10, 25);

    if (frogY > height) gameOver = true;
  } else {
    fill(0, 150);
    rect(0, 0, width, height);
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("GAME OVER", width/2, height/2 - 20);
    textSize(20);
    text("Score: " + score, width/2, height/2 + 10);
    text("Press R to Restart", width/2, height/2 + 40);
  }
}

void keyPressed() {
  if (key == 'a' || keyCode == LEFT) {
    moveLeft = true;
  }
  if (key == 'd' || keyCode == RIGHT) {
    moveRight = true;
  }
  if (key == ' ' && !jumping) {
    velocityY = -12;
    jumping = true;
  }
  if (key == 'r' && gameOver) restartGame();
}

void keyReleased() {
  if (key == 'a' || keyCode == LEFT) {
    moveLeft = false;
  }
  if (key == 'd' || keyCode == RIGHT) {
    moveRight = false;
  }
}

void restartGame() {
  float startY = height - 150;
  for (int i = 0; i < numPlatforms; i++) {
    platforms[i].x = random(50, width - 100);
    platforms[i].y = startY - i * spacing;
    platforms[i].landed = false;
  }

  frogX = platforms[0].x + 10;
  frogY = platforms[0].y - frogH;
  velocityY = 0;
  jumping = false;
  score = 0;
  gameOver = false;
}
