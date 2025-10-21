Dino d;
ArrayList<Cactus> cacti = new ArrayList<Cactus>();

void setup() {
  size(800, 600);
  d = new Dino();
}

void draw() {
  background(255);
  d.update();
  d.display();
  
  for (Cactus c : cacti) {
    c.update();
    c.display();
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
