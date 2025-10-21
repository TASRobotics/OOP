Dino d;
ArrayList<Cactus> cacti = new ArrayList<Cactus>();
int timeReset = 0;
boolean gameover = false;
void setup() {
  d = new Dino();
  size(800, 600);
}

void draw() {
  if (gameover == false) {
    background(200);
    d.display();
    d.update();
    for (Cactus temp : cacti) {
      temp.display();
      temp.update();
      if(d.check(temp) == true){
        gameover = true;
      }
    }
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
}
