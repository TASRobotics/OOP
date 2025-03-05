//TODO: have something follow path
//TODO: tower object
//TODO: enemies
String screen = "mainGame";

Path p = new Path();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Spike> spikes = new ArrayList<Spike>();
Player user = new Player();

void setup() {
  //fullScreen();
  size(1600, 1000);
  enemies.add(new Enemy());
}

void draw() {
  switch(screen) {
  case "mainGame":
    mainGame();
    break;
  case "gameOver":
    gameOver();
    break;
  }
}

void mainGame() {
  background(200);
  user.drawHealth();
  user.checkGameOver();
  p.display();
  for(Spike s : spikes){
    s.display();
    for(Enemy e : enemies){
      s.check(e);
    }
  }
  for (Enemy e : enemies) {
    e.display();
    e.move();
  }
  removeDeadEnemies();
  removeDeadSpikes();
}


void removeDeadEnemies() {
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy test = enemies.get(i);
    if (test.removeme) {
      enemies.remove(test);
    }
  }
}
void removeDeadSpikes() {
  for (int i = spikes.size() - 1; i >= 0; i--) {
    Spike test = spikes.get(i);
    if (test.removeme) {
      spikes.remove(test);
    }
  }
}


void gameOver() {
  background(255, 0, 0);
}



void keyPressed() {
  enemies.add(new Enemy());
}

void mousePressed(){
  spikes.add(new Spike(mouseX, mouseY));
}
