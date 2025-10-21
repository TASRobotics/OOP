Dino d;
Obs o;
ArrayList<Obs> obstacles = new ArrayList<Obs>();
boolean gameOver = false;
int spawnAfterX;
int offset = 0;
void setup() {
  size(800, 600);
  d = new Dino();
  textAlign(CENTER, CENTER);
  spawnAfterX = (int)random(60, 120);
}
void draw() {
  if (!gameOver) {
    if (frameCount == spawnAfterX) {
      obstacles.add(new Obs());
      spawnAfterX += (int)random(60, 120);
    }
    mainGame();
  } else {
    gameOver();
    
  }
}
void keyPressed() {
  if (key == ' ') {
    d.jump();
  }
  if (key =='x') {
    obstacles.add(new Obs());
  }

  if (key == 'r') {
    obstacles.clear();
    spawnAfterX = frameCount + (int)random(60, 130);
    gameOver = false;
    offset = frameCount;
  }
}
void gameOver() {
  background(255, 0, 0);
  fill(255);
  text("GAME OVER", 400, 300);
  textSize(100);
}
void mainGame() {
  background(150);
  d.update();
  d.display();

  for (int i = 0; i < obstacles.size(); i++) {
    Obs o = obstacles.get(i);
    o.move();
    o.display();
    if (d.isTouching(o)) {
      gameOver = true;
    }
    showFrameCount();
  }
}
void showFrameCount() {
  fill(255);
  textSize(30);
  textAlign(CORNER, CORNER);
  text(frameCount - offset, 50, 50);
}
