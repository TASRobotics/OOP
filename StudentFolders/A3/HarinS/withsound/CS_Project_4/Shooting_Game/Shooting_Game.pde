import java.util.HashSet;
HashSet<Character> keysDown = new HashSet<Character>();

float x = 400;
float y = 500;
float speed = 5;
float x1 = 400;
float y1 = -50;
float speed1 = 3;
float x3;
float y3 = 500;
float speed2 = 10;
boolean shooting = false;

void setup() {
  size(800, 600);
  background(50);
}

void draw() {
  background(50);

  // Movement logic based on keys held down
  if (keysDown.contains('a')) {
    x -= speed;
  }
  if (keysDown.contains('d')) {
    x += speed;
  }
  
  

  circle(x, y, 100);
  if (x > 850) {
    x = -50;
  }
  
  if (x < -50) {
    x = 850;
  }
  
  
  circle(x1,y1,50);
  y1 += speed1;
  
  
  if (y1 > 600) {
    y1= 0;
    x1 = random(50,750);
  }
  
  if (keysDown.contains(' ')){
   shooting = true;
   fill(255);
    circle(x3, y3, 10);
    y3 = y3 - speed2;
  }
  else {
    shooting = false;
  }
  if (y3 <= 0) {
    shooting = false;
  }
  if (shooting == false) {
    y3 = 500;
    x3 = x;
  }
  if (y3 <= 0) {
    y3 = 500;
  }
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
