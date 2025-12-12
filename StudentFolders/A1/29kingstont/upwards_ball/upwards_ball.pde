float x, y, dim;
float dy = 0;
float acc = 0;

color ballColor;
color bgColor;
color nextBallColor;
color nextBgColor;
boolean spawnBallNext = false;

int lastBeat = 0;
int beatInt = 500;
int beatNum = 0;

void setup() {
  //size(800, 800);
  fullScreen();
  dim = 80;
  x = random(dim/2, width-dim/2);
  y = height-dim/2-10;

  ballColor = randomColor();
  bgColor = color(0);
  lastBeat = millis();
}

void draw() {
  background(bgColor);
  strokeWeight(0);
  rect(0, 0, beatNum*(width/4.0), height);
  
  if (millis()-lastBeat >= beatInt) {
    fill(ballColor);
    if (beatNum == 3 && spawnBallNext) {
       ballColor = nextBallColor;
       bgColor = nextBgColor;
    }
    if (beatNum == 4 && spawnBallNext) {
      x = random(dim/2, width-dim/2);
       y = height-dim/2-10;
       spawnBallNext = false;
    }
    beatNum = beatNum%4+1;
    lastBeat = millis();
  }
  
  strokeWeight(3);
  stroke(255);
  circle(x, y, dim);
  y += dy;
  dy += acc;

  if (y < 0-dim/2) {
    dy = 0;
    acc = 0;
    nextBgColor = ballColor;
    nextBallColor = randomColor();
    spawnBallNext = true;
  }
}

color randomColor() {
  return color(random(255), random(255), random(255));
}

void keyPressed() {
  if (key == ' ' && dy == 0) {
    dy = -20;
    //acc = random(-0.5, -2);
  }
}
