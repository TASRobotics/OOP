Dino d;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

void setup() {
  size(800, 600);
  d = new Dino();
  obstacles.add(new Obstacle());
}


void draw() {
  background(150);
  d.update();
  d.display();

  for (int i =0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.move();
    o.display();
  }
  println(obstacles.get(0).Opos.y);
}


void keyPressed() {
  if (key == ' ') {
    d.jump();
  }
  if (key == 'x') {
    obstacles.add(new Obstacle());
  }
}
