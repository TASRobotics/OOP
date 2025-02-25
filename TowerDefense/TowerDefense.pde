//TODO: have something follow path
//TODO: tower object
//TODO: enemies
String screen = "mainGame";

Path p = new Path();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
Player user = new Player();

void setup() {
  //fullScreen();
  size(1600, 1000);
  enemies.add(new Enemy());
}

void draw() {
  switch(screen){
    case "mainGame":
      mainGame();
      break;
    case "gameOver":
      gameOver();
      break;
  }
}

void mainGame(){
    background(200);
  user.drawHealth();
  user.checkGameOver();
  p.display();
  for (Enemy e : enemies) {
    e.display();
    e.move();
  }
  removeDeadEnemies();
}


void removeDeadEnemies() {
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy test = enemies.get(i);
    if (test.removeme) {
      enemies.remove(test);
    }
  }
}



void gameOver(){
  background(255, 0, 0);
}



void keyPressed(){
  enemies.add(new Enemy()); 
}
