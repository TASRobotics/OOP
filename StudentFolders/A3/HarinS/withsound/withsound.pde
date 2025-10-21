import processing.sound.*;

import processing.sound.*;

int x = 50;
int y = 50;
int dia = 100;
int xspeed = 5;
int yspeed = 5;
int x1 = 100;
int y1 = 100;
int dia1 = 70;
int xspeed1 = 10;
int yspeed1 = 2;
int x2 = 150;
int y2 = 150;
int dia2 = 50;
int xspeed2 = 2;
int yspeed2 = 15;
boolean diagrow = false;
boolean diagrow1 = false;
boolean diagrow2 = false;
boolean music1 = false;
boolean music2 = false;

import processing.sound.*;

SoundFile leftsound;
SoundFile upsound;

void setup() {
  size(800,600);
  leftsound = new SoundFile(this, "1.aif");
  upsound = new SoundFile(this, "2.aif");
}

void draw() {
  fill(245,235,215,65);
  rect(0,0,800,600);
  fill(200,65,40);
  circle(x,y,dia);
  x = x + xspeed;
  y = y + yspeed;
  if (x >= 800 - (dia/2) || x < (dia/2)) {
    xspeed = (xspeed + 3) * -1;
    yspeed = yspeed + 3;
    dia = dia - 3;
    music1 = true;
  } else {
    music1 = false;
  }
  if (y >= 600 - (dia/2) || y < (dia/2)) {
    yspeed = (yspeed + 3) * -1;
    xspeed = xspeed + 3;
    dia = dia - 3;
    music2 = true;
  } else {
    music2 = false;
  }
  if (dia < 10) {
    xspeed = 10;
    yspeed = 10;
    diagrow = true;
  }
  
  if (diagrow == true) {
    dia = dia + 1;
  }
  if (dia > 70) {
    diagrow = false;
  }
  
  fill(220,100,20);
  circle(x1,y1,dia1);
  x1 = x1 + xspeed1;
  y1 = y1 + yspeed1;
  if (x1 >= 800 - (dia1/2) || x1 < (dia1/2)) {
    xspeed1 = (xspeed1 + 3) * -1;
    yspeed1 = yspeed1 + 3;
    dia1 = dia1 - 3;
  }
  if (y1 >= 600 - (dia1/2) || y1 < (dia1/2)) {
    yspeed1 = (yspeed1 + 3) * -1;
    xspeed1 = xspeed1 + 3;
    dia1 = dia1 - 3;
  }
  if (dia1 < 10) {
    xspeed1 = 10;
    yspeed1 = 10;
    diagrow1 = true;
  }
  
  if (diagrow1 == true) {
    dia1 = dia1 + 1;
  }
  if (dia1 > 100) {
    diagrow1 = false;
  }
  
  fill(220,180,70);
  circle(x2,y2,dia2);
  x2 = x2 + xspeed2;
  y2 = y2 + yspeed2;
  if (x2 >= 800 - (dia2/2) || x2 < (dia2/2)) {
    xspeed2 = (xspeed2 + 3) * -1;
    yspeed2 = yspeed2 + 3;
    dia2 = dia2 - 3;
  }
  if (y2 >= 600 - (dia2/2) || y2 < (dia2/2)) {
    yspeed2 = (yspeed2 + 3) * -1;
    xspeed2 = xspeed2 + 3;
    dia2 = dia2 - 3;
  }
  if (dia2 < 10) {
    xspeed2 = 10;
    yspeed2 = 10;
    diagrow2 = true;
  }
  
  if (diagrow2 == true) {
    dia2 = dia2 + 1;
  }
  if (dia2 > 100) {
    diagrow2 = false;
  }
  if (music1 == true){
    leftsound.loop();
  } else {
    leftsound.stop();
  }
  if (music2 == true){
    upsound.loop();
  } else {
    upsound.stop();
  }
  
}
