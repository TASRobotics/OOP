float x, y;
float cx, cy;

float tx, ty, tcy;
float hx, hy, hcx;

boolean gameover = false;

void setup() {
  size(800, 800);
  spawnDodger();
}

void draw() {
  if (gameover == false) {
    background(50);
    fill(255);
    circle(x, y, 50);
    movePlayer();
    keepInside();

    fill(255, 0, 0);
    circle(tx, ty, 50);
    circle(hx, hy, 50);
    
    ty += tcy;
    hx += hcx;
    
    if (ty > height + 100) {
      tx = random(0, width);
      ty = -100;
      tcy = 5;
    }
    
     if (hx > width + 100) {
      hy = random(0, height);
      hx = -100;
      hcx = 5;
    }
    
    if(circleCircle(x, y, 25, tx, ty, 25) == true){
      gameover = true;
    }
     if(circleCircle(x, y, 25, hx, hy, 25) == true){
      gameover = true;
    }
  } else {
    background(255, 0, 0);
  }
}

void keyPressed() {
  if (key == 'w') {
    cy -= 0.5;
  }
  if (key == 's') {
    cy += 0.5;
  }
  if (key == 'a') {
    cx -= 0.5;
  }
  if (key == 'd') {
    cx += 0.5;
  }
  if (key == ' ') {
    cx = 0;
    cy = 0;
  }
  if(key == 'r'){
    spawnDodger();
  }
}

void movePlayer() {
  x+= cx;
  y+= cy;
  cx = constrain(cx, -5, 5);
  cy = constrain(cy, -5, 5);
  cx = cx * 0.97;
  cy = cy * 0.97;
}

void keepInside() {
  if (y < 0) {
    y = 0;
    cy = -cy;
  }
  if (y > height) {
    y = height;
    cy = -cy;
  }
  if (x < 0) {
    x = 0;
    cx = -cx;
  }
  if (x > width) {
    x = width;
    cx = -cx;
  }
}

void spawnDodger(){
   x = width/2;
  y = height/2;
  
  tx = random(0, width);
  ty = -100;
  tcy = 5;
  
  hx = -100;
  hy = random(0, height);
  hcx = 6;
}
