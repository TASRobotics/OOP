ArrayList <Particle> circs = new ArrayList <Particle>();

void setup() {
  size(800, 600);
  for (int i = 0; i < 50; i++) {
    circs.add(new Particle());
    circs.get(i).randomizeColor();
  }
  background(50);
}

void draw() {
  noStroke();
  for (int i = 0; i < 50; i++){
    circs.get(i).display();
    circs.get(i).move();
  }
}
