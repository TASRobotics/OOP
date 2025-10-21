ArrayList<Integer> sizes = new ArrayList<Integer>();
ArrayList<PVector> positions = new ArrayList<PVector>();

void setup(){
  size(800,600);
}

void draw(){
  background(50);
  for (int i = 0; i < positions.size(); i++){
    circle(positions.get(i).x, positions.get(i).y, sizes.get(i));
    positions.get(i).y += 3;
    sizes.set(i, sizes.get(i) - 2);
  }

}

void mousePressed(){
  positions.add(new PVector(mouseX, mouseY));
  sizes.add(100);
}
