float rectX = 400;     // Starting X position of the rectangle (centered horizontally)
float rectY = 300;     // Starting Y position of the rectangle
float rectWidth = 60;  // Width of the rectangle
float rectHeight = 40; // Height of the rectangle

float gravity = 0.2;   // Gravity pulling the rectangle down
float velocity = 0;    // Initial velocity (starts at 0)
boolean isJumping = false;  // Is the rectangle currently jumping?

float moveSpeed = 5;   // Speed of horizontal movement

boolean onBox = false;
import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();

Box b;
Box b2;

void setup() {
  size(800, 600);
  b = new Box(500, 400, 100, 100);
  b2 = new Box(300, 250, 100, 100);
}

void draw() {
  background(200); // Light gray background
  b.drawBox();
  b2.drawBox();
  
  onBox = false;
  b.stopPlayer();
  b2.stopPlayer();


  //boxstuff();
  customPress();
  // Update rectangle's position with gravity
  if (!onBox) {
    velocity += gravity;  // Increase velocity due to gravity
  }
  rectY += velocity;    // Move the rectangle downward based on its velocity

  // Check if the rectangle has hit the floor
  if (rectY + rectHeight > height) {
    rectY = height - rectHeight;  // Position it on the floor
    velocity = 0;                  // Stop vertical movement (no more falling)
    isJumping = false;             // Reset jumping flag
  }

  // Draw the rectangle
  fill(255, 0, 0);  // Red color for the rectangle
  rect(rectX, rectY, rectWidth, rectHeight);
}

void customPress() {

  for (Integer k : keysDown) {
    if (k == 87) { //w
      if (!isJumping) {
        velocity = -10;  // Negative velocity to make it jump upwards
        isJumping = true;
      }
    }
    if (k == 68) { //d
      rectX += moveSpeed;  // Move right
    }

    if (k == int('A')) {
      rectX -= moveSpeed;  // Move left
    }
  }
}

void keyPressed(KeyEvent e) {
  println(e.getKeyCode());
  keysDown.add(e.getKeyCode());
}

void keyReleased(KeyEvent e) {
  keysDown.remove(e.getKeyCode());
}

boolean keyDown(int kcode) {
  return keysDown.contains(kcode);
}
