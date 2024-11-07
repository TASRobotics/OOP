int screen = 0;
float x = 400;
float y = 300;
float speed = 4;

boolean playerHasSword = false;

import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();
void setup() {
  //fullScreen();
  size(800, 600);
}

void draw() {
  background(50);


  switch(screen) {
  case 0:
    screen0();
    break;
  case 1:
    screen1();
    break;
  default:
    break;
  }
  customPress();

  drawPlayer();
}

void drawPlayer() {
  fill(255);
  circle(x, y, 50);
}



void screen1() {
  // Rectangle 1
  fill(255, 165, 0); // Bright Orange
  rect(150, 120, 180, 90); // x, y, width, height

  // Rectangle 2
  fill(75, 0, 130); // Indigo
  rect(350, 250, 140, 120);

  // Rectangle 3
  fill(0, 255, 255); // Cyan
  rect(500, 100, 200, 150);

  // Rectangle 4
  fill(255, 20, 147); // Deep Pink
  rect(600, 400, 160, 90);
  
  if(!playerHasSword){
   drawSwordOnFloor(); 
  }


  if (x < 0) {
    screen = 0;
    x = 800;
  }
  if (y < 0) {
    y = 0;
  }
}

void drawSwordOnFloor(){
   // Blade (long vertical rectangle)
  fill(200, 200, 200); // Light gray for the blade
  rect(40, 10, 20, 60); // x, y, width, height
  
  // Guard (horizontal rectangle at the top of the blade)
  fill(150, 75, 0); // Brown for the guard
  rect(30, 10, 40, 5); // x, y, width, height
  
  // Handle (short vertical rectangle)
  fill(139, 69, 19); // Dark brown for the handle
  rect(45, 70, 10, 25); // x, y, width, height
  
  // Pommel (circle at the bottom of the handle)
  fill(150, 75, 0); // Brown for the pommel
  ellipse(50, 95, 15, 15); // x, y, width, height
}

void customPress() {

  for (Integer k : keysDown) {
    if (k == 87) { //w
      y -= speed;
    }
    if (k == 68) { //d
      x += speed;
    }
    if (k == int('S')) {
      y += speed;
    }
    if (k == int('A')) {
      x -= speed;
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
