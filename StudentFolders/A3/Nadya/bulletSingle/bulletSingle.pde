float px = 400;
float py = 550;
float bulletx = 400;
float bullety = 550;

float targetx = 200;
float targety = 25;
float targetw = 75;
float targeth = 75;

boolean bulletHasBeenFired = false;
boolean hit() {
  if (bulletx >= targetx && bulletx <= targetx + targetw && bullety >= targety && bullety <= targety + targeth) {
    return true;
  } else {
    return false;
  }
}

int score = 0;


void setup() {
  size(800, 600);
}


void draw() {
  background(30);
  px = mouseX;
  drawPlayerAndBullet();
  drawScore();
  textSize(40);
  text(score, 50, 50);
  rect(targetx, targety, targetw, targeth);

  if (bulletHasBeenFired == true) {
    bullety -= 5;
  } else {
    bulletx = px;
  }

  if (bullety < 0) {
    bulletHasBeenFired = false;
    bullety = py;
    bulletx = px;
  }
}

void keyPressed() {
  if (key == ' ') {
    if (bulletHasBeenFired != true) {
      shoot();
    }
  }
}

void drawPlayerAndBullet() {
  circle(px, py, 50);
  circle(bulletx, bullety, 10);
}

void shoot() {
  bulletHasBeenFired = true;
}

void drawScore() {
  if (hit() && bulletHasBeenFired) {
    score++;
  }
}
