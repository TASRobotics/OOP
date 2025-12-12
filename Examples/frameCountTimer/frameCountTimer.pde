int frameWhereMouseWasPressed = 0;
int waitXFrames = 30;
boolean timerRunning = false;

color c;

float circleSize = 100;
int changeEveryNFrames = 10;
boolean changeCircleSize = false;

void setup() {
  //fullScreen();
  size(800, 600);
  c = color(255, 255, 255);
}

void draw() {
  background(c);
  circle(width/2, height/2, circleSize);
  
  if (timerRunning) { //change bgcolor 30 frames after mouse is pressed (delay)
    if (frameCount >= frameWhereMouseWasPressed + waitXFrames) {
      c = color(random(255), random(255), random(255));
      timerRunning = false;
    }
  }

  if (changeCircleSize) { //repetitive action every N frames
    if (frameCount % changeEveryNFrames == 0) {
      circleSize = random(10, 200);
    }
  }
}

void mousePressed() {
  timerRunning = true;
  frameWhereMouseWasPressed = frameCount;
}

void keyPressed() {
  changeCircleSize = !changeCircleSize;
}
