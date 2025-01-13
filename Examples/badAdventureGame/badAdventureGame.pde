int screen = 0;
int lastScreen;
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
  case -1:
    inventory();
    break;
  default:
    break;
  }
  customPress();
  if(screen != -1){
    drawPlayer();
  }
}

void drawPlayer() {
  fill(255);
  circle(x, y, 50);
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
  
  if(key == 'i'){
      if(screen != -1){
        lastScreen = screen;
        screen = -1;
      } else {
        screen = lastScreen; 
      }
    }
  
}

void keyReleased(KeyEvent e) {
  keysDown.remove(e.getKeyCode());
}

boolean keyDown(int kcode) {
  return keysDown.contains(kcode);
}
