Dino d;
ArrayList<Cactus> cacti = new ArrayList<Cactus>();

void setup() {
  size(800, 600);
  d = new Dino();
}

void draw() {
  background(50);
  d.display(); //dinosaur "d" should display itself
  d.update();

  for (Cactus c : cacti) {
    c.display();
    c.update();
  }
}

void keyPressed() {
  if (key == ' ') {
    d.jump(); //d will jump
  }

  if (key == 'c') {
    cacti.add(new Cactus());
  }
}
