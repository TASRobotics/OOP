String screen = "start";
int score = 0;
String game = "gam";
void setup(){
  //fullScreen();
  size(800, 600);
  game = game + "e";
  println(game);
}

void draw(){
 if(screen.equals("start")){
   startScreen();
 } else if (screen.equals("game")){
   gameScreen();
 } else if (screen.equals("game over")){
   gameOverScreen();
 }
}

void keyPressed(){
  if(key == ' ' && screen.equals("start")){
    screen = "game";
  }
  if(key == 'r' && screen.equals("game over")){
    screen = "start";
    reset();
  }
}

void mousePressed(){
  if(screen == "game"){
    score++;
  }
}
