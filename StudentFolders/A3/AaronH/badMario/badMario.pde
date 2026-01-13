float rectX = 400;
float rectY = 300;
float rectWidth = 60;
float rectHeight = 40;

float gravity = 0.6;
float velocity = 0;
boolean isJumping = false;

float moveSpeed = 5;
boolean onBox = false;

import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();

Box b1, b2;

void setup() {
  size(800, 600);
  b1 = new Box(500, 400, 100, 100);
  b2 = new Box(300, 250, 100, 100);
}

void draw() {
  background(200);

  // Draw boxes
  b1.drawBox();
  b2.drawBox();

  customPress();

  // Apply gravity
  velocity += gravity;
  rectY += velocity;

  // Check landing on boxes
  boxstuff(b1, b2);

  // Floor collision
  if (rectY + rectHeight > height) {
    rectY = height - rectHeight;
    velocity = 0;
    isJumping = false;
    onBox = true;
  }

  // Draw player
  fill(255, 0, 0);
  rect(rectX, rectY, rectWidth, rectHeight);
}

void customPress() {
  for (Integer k : keysDown) {
    if (k == 87) { // W
      if (!isJumping) {
        velocity = -20;  // jump power
        isJumping = true;
      }
    }
    if (k == 68) { // D
      rectX += moveSpeed;
    } 
    if (k == 65) { // A
      rectX -= moveSpeed;
    }
  }
}

void keyPressed(KeyEvent e) {
  keysDown.add(e.getKeyCode());
}

void keyReleased(KeyEvent e) {
  keysDown.remove(e.getKeyCode());
}
