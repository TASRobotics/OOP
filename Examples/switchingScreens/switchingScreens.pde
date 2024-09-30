int screen = 0;

void setup() {
  //fullScreen();
  size(800, 600);
}

void draw() {
  //background(50);
  textSize(50);
  if (screen == 0) {
    startScreen();
  } else if (screen == 1) {
    game();
  } else if (screen == 2) {
    endScreen();
  }
}

void startScreen() {
  background(255);
  fill(0);
  text("press space to begin", 100, 100);
}

void game() {
  background(0, 255, 32);
  if(mouseX > 700){
    screen = 2; 
  }
}

void endScreen() {
  background(255, 0, 0);
  fill(255);
  text("ur unalived", 100, 100);
}

void keyPressed(){
  if(key == ' '){
    screen = 1;
  }
}
