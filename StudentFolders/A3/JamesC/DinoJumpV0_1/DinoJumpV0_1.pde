Dino d;
ArrayList<Cactus> cacti = new ArrayList<Cactus>();
int timeReset = 0;
boolean gameover = false;

void setup() {
  size(800, 600);
  d = new Dino();
}

void draw() {
  if (gameover == false) {
    background(150);
    d.display();
    d.update();

    for (Cactus c : cacti) {
      c.display();
      c.update();
      if (d.check(c) == true) {
        gameover = true;
      }
    }
    showScore();
  } else {
    background(255, 0, 0);
  }
}

void keyPressed() {
  if (key == ' ') {
    d.jump();
  }
  if (key == 'c') {
    cacti.add(new Cactus());
  }
  if (key == 'r') {
    reset();
  }
}

void showScore() {
  fill(255);
  textSize(40);
  text(frameCount - timeReset, 50, 50);
}

void reset() {
  cacti.clear();
  timeReset = frameCount;
}
