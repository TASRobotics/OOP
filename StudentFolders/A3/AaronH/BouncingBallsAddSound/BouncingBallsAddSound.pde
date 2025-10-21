import processing.sound.*;

float x = 400;
float y = 300;
float cx = 3;
float cy = 1;

float x2 = 400;
float y2 = 300;
float cx2 = -6;
float cy2 = -2;

SoundFile topSound;
SoundFile bottomSound;
SoundFile leftSound;
SoundFile rightSound;

void setup(){
  size(800, 600);
  topSound = new SoundFile(this, "1.aif");
  bottomSound = new SoundFile(this, "");
  leftSound = new SoundFile(this, "");
  rightSound = new SoundFile(this, "");
}

void draw(){
  background(50); 
  
  fill(150, 50, 80);
  circle(x, y, 50);
  x += cx;
  y += cy;
  
  if(x > width || x < 0){
    cx = -cx;
    if(x > width) rightSound.play();
    else leftSound.play();
  }
  
  if(y > height || y < 0){
    cy = -cy;
    if(y > height) bottomSound.play();
    else topSound.play();
  }
  
  fill(150, 50, 200);
  circle(x2, y2, 50);
  x2 += cx2;
  y2 += cy2;
  
  if(x2 > width || x2 < 0){
    cx2 = -cx2;
    if(x2 > width) rightSound.play();
    else leftSound.play();
  }
  
  if(y2 > height || y2 < 0){
    cy2 = -cy2;
    if(y2 > height) bottomSound.play();
    else topSound.play();
  }
}
