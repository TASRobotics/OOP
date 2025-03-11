//TODO: have something follow path
//TODO: tower object
//TODO: enemies
String screen = "mainGame";

Path p = new Path();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Spike> spikes = new ArrayList<Spike>();
Player user = new Player();
Tower t = new Tower(1150, 650);

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
  if(frameCount % 60 == 0){
    enemies.add(new BigBoy());
  }
  background(200);
  user.drawHealth();
  user.checkGameOver();
  p.display();
  t.display();
  t.defend(enemies);
  for(Spike s : spikes){
    s.display();
    for(Enemy e : enemies){
      checkSpikeEnemyCollision(s, e);
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

void checkSpikeEnemyCollision(Spike s, Enemy e){
  if(circleCircle(e.pos.x, e.pos.y, e.d/2, s.pos.x, s.pos.y, 5)){
    s.kill();
    e.kill();
    //score += 5;
  }
}

void keyPressed() {
  enemies.add(new Enemy());
}

void mousePressed(){
  spikes.add(new Spike(mouseX, mouseY));
}
