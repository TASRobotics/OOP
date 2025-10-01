Dino d;
ArrayList<Obs> obstacles = new ArrayList<Obs>();

void setup() {
  //fullScreen();
  size(800, 600);
  d = new Dino();
}

void draw() {
  background(150);
  d.update();
  d.display();
  
  for(int i = 0; i < obstacles.size(); i++){
    Obs o = obstacles.get(i);
    o.move();
    o.display();
  }

  //for (Obs o : obstacles) {
  //  o.move();
  //  o.display();
  //}
}

void keyPressed() {
  if (key == ' ') {
    d.jump();
  }
  if (key == 'x') {
    obstacles.add(new Obs());
  }
}
