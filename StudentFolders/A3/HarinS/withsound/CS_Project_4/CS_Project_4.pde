// Set to track currently pressed keys
import java.util.HashSet;
HashSet<Character> keysDown = new HashSet<Character>();

float x = 200;
float y = 200;
float speed = 10;

void setup() {
  size(800, 600);
}

void draw() {
  background(255);

  // Movement logic based on keys held down
  if (keysDown.contains('w')) {
    y -= speed;
  }
  if (keysDown.contains('s')) {
    y += speed;
  }
  if (keysDown.contains('a')) {
    x -= speed;
  }
  if (keysDown.contains('d')) {
    x += speed;
  }
  if(circlesTouching(x, y, 30, mouseX, mouseY, 50)){
    fill(255, 0, 0);
  } else {
    fill(255);
  }
  
  

  ellipse(x, y, 50, 50);
  if (x > 800) {
    x = 0;
  }
  
  if (x < 0) {
    x = 800;
  }
  if (y > 600) {
    y = 0;
  }
  if (y < 0) {
    y = 600;
  }
  
  ellipse(mouseX, mouseY, 50, 50);
  
  
}

// Add key to set when pressed
void keyPressed() {
  keysDown.add(Character.toLowerCase(key));
}

// Remove key from set when released
void keyReleased() {
  keysDown.remove(Character.toLowerCase(key));
}


boolean circlesTouching(float x1, float y1, float d1, float x2, float y2, float d2) {
  float r1 = d1 / 2;
  float r2 = d2 / 2;
  float dx = x2 - x1;
  float dy = y2 - y1;
  float distance = sqrt(dx * dx + dy * dy);
  
  return distance <= (r1 + r2);
}
