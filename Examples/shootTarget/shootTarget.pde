float bx, by, bd, bxv, cx, cy, cw, ch, tx, ty, tw, th;
boolean fired = false;
int score = 0;

void setup() {
  //fullScreen();
  size(800, 600);
  bx = width + 100;
  by = height + 100;
  bd = 20;
  bxv = 0;

  cw = 40;
  ch = 100;
  cx = width - 50;
  cy = (height/2) - ch/2;

  tw = 25;
  th = 100;
  tx = 25;
  ty = height/2 - 50;
}

void draw() {
  display();
  moveObjects();
  checkTarget();
  hitEdge();
}

void mousePressed() {
  if (fired == false) {
    fired = true;
    bx = cx + (cw/2);
    by = cy + (ch/2);
    bxv = -3;
  }
}

void checkTarget() {
  if (bx > tx && bx < tx + tw && by > ty && by < ty + th) {
    score = score + 1;
    bxv = 0;
    bx = width + 100;
    by = height + 100;
    fired = false;
  }
}

void hitEdge() {
  if (bx < 0) {
    score = score - 1;
    bx = width + 100;
    by = height + 100;
    fired = false;
    bxv = 0;
  }
}

void moveObjects() {
  cy = mouseY - ch/2; //this moves the cannon to the mouse location
  bx = bx + bxv; //this moves the ball sideways
}

void display() {
  background(50);
  rect(cx, cy, cw, ch);
  rect(tx, ty, tw, th);
  circle(bx, by, bd);
  textSize(30);
  text(score, 50, 50);
}
