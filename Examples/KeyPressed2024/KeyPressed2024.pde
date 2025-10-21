float x = 400;
float y = 300;
float speed = 1.5;

float x2 = 500;
float y2 = 400;
float speed2 = 2;

import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();

void setup() {
  //fullScreen();
  size(800, 600);
}

void draw() {
  background(50); 
  circle(x, y, 50);
  circle(x2, y2, 50);

  
  customPress();
  
  
  //wrap around
  if (x > width+25)
  x=-25;
  if (x < -25)
  x=width+25;
  
  if (y > height+25)
  y=-25;
  if (y < -25)
  y=height+25;
  
  //wrap around
  if (x2 > width+25)
  x2=-25;
  if (x2 < -25)
  x2=width+25;
  
  if (y2 > height+25)
  y2=-25;
  if (y2 < -25)
  y2=height+25;
}

void customPress() {
  if(keysDown.contains(81)){ //q
    speed = 40;
  } else {
    speed = 1.5;
  }
  if(keysDown.contains(90)){ //z
    x = random(0,600);
    y = random(0,800);
  } 
  if(keysDown.contains(80)){ //p
    speed2 = 40;
  } else {
    speed2 = 1.5;
  }
  if(keysDown.contains(77)){ //m
    x2 = random(0,800);
    y2 = random(0,600);
  } 
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
    
    if (k == 38) { //up arrow
      y2 -= speed2;
    }
    if (k == 39) { //right arrow
      x2 += speed2;
    }
    if (k == 40) { //down arrow
      y2 += speed2;
    }
    if (k == 37) { //left arrow
      x2 -= speed2;
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
