float x = 400;
float y = 300;
float cx = 4;
float cy = 2;
float x2 = 400;
float y2 = 300;
float cx2 = -6;
float cy2 = -3;

import processing.sound.*;

SoundFile top;
SoundFile bottom;
SoundFile left;
SoundFile right;

void setup() {
  //fullScreen();
  size(800, 600);
  top = new SoundFile(this, "1.aif");
  bottom = new SoundFile(this, "2.aif");
  left = new SoundFile(this, "3.aif");
  right = new SoundFile(this, "4.aif");

}

void draw() {
  background(50);
  fill(150, 50, 80);
  circle(x, y, 50);
  x += cx;
  y += cy;

  if (x > width ) {
    cx = -cx;
    left.play(1.75);
    left.amp(0.5);
  }
  if (x < 0) {
    cx = -cx;
    right.play(1.75);
    right.amp(0.5);
  }
  if (y > height){
    cy = -cy;
    bottom.play(1.75);
    bottom.amp(0.5);
  }
  if(y < 0) {
    cy = -cy;
    top.play(1.75);
    top.amp(0.5);
  }

  fill(150, 50, 200);
  circle(x2, y2, 50);
  x2 += cx2;
  y2 += cy2;

  if (x2 > width ) {
    cx2 = -cx2;
    left.play(1.75);
    left.amp(0.5);
  }
  if (x2 < 0) {
    cx2 = -cx2;
    right.play(1.75);
    right.amp(0.5);
  }
  if (y2 > height){
    cy2 = -cy2;
    bottom.play(1.75);
    bottom.amp(0.5);
  }
  if(y2 < 0) {
    cy2 = -cy2;
    top.play(1.75);
    top.amp(0.5);
  }
}
