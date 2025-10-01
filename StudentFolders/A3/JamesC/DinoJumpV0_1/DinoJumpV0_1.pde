Dino d;
ArrayList<Cactus> cacti = new ArrayList<Cactus>();

void setup() {
  size(800, 600);
  d = new Dino();
}

void draw() {
  background(150);
  d.display();
  d.update();

  for (Cactus c : cacti) {
    c.display();
    c.update();
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
