color full = color(0, 255, 0);
color dead = color(255, 0, 0);

float health = 100;
color current;

boolean menuOpen = false;

void setup() {
  size(600, 600);
  current = full;
}


void draw() {

  float pos = health/100;
  current = lerpColor(dead, full, pos);


  fill(current);
  circle(300, 300, 400);
  if (menuOpen == false) {
    //move tiles
  }
}

void mouseClicked() {
  if(menuOpen == true){
  //code to check if buttonA was clicked on
  }
}

void keyPressed() {
  health -= 10;
}
