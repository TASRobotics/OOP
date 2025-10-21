ArrayList<PVector> positions = new ArrayList<PVector>();
void setup () {
  size(800, 600);
}
void draw() {
  background(50);
  // old method
  for (int i = 0; i < positions.size(); i++) {
    positions.get(i).y -= -5;
    circle(positions.get(i).x, positions.get(i).y, 10);
  }
}


void mousePressed() {
  positions.add(new PVector(mouseX, mouseY));
}
