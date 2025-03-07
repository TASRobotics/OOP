//TODO: have something follow path
//TODO: tower object
//TODO: enemies
String screen = "mainGame";

Path p = new Path();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Glue> glues = new ArrayList<Glue>();
ArrayList<Tower> towers = new ArrayList<Tower>();
ArrayList<BlueEnemy> blueEnemies = new ArrayList<BlueEnemy>();
Player user = new Player();
boolean glueOn = false;



void setup() {
  rectMode(CENTER);
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

  for (Glue g : glues) {
    g.display();
  }
  for (Tower t : towers) {
    t.display();
    t.shoot(enemies, blueEnemies);
  }
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy e = enemies.get(i);
    e.move();
    e.display();

    for (int j = glues.size() - 1; j >= 0; j--) {
      Glue g = glues.get(j);
      if (g.alive && dist(e.pos.x, e.pos.y, g.x, g.y) < 30) {
        e.slowDown();
        g.delete();
        glues.remove(j);
      }
    }
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



void gameOver() {
  background(255, 0, 0);
}

void mousePressed() {
  if (glueOn) {
    glues.add(new Glue(mouseX, mouseY));
  } else {
    towers.add(new Tower(mouseX, mouseY));
  }
}


void keyPressed() {
  if ((int)key == 32) {
    enemies.add(new Enemy());
  }
  if (key == 'b') {
    enemies.add(new BlueEnemy());
  }
  if (key == '1') {
    glueOn = true; // Select Glue tool
  }
}
