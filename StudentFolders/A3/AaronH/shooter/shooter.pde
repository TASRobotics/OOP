ArrayList<PVector> positions = new ArrayList<PVector>();
ArrayList<Integer> sizes = new ArrayList<Integer>();

void setup() {
  size(800, 600);
}

void draw() {
  background(50);
  
  for (int i = 0; i < positions.size(); i++) {
    circle(positions.get(i).x, positions.get(i).y, sizes.get(i));
    
    // Move circle down
    positions.get(i).y += 3;
    
    // Decrease size
    sizes.set(i, sizes.get(i) - 2);
  } 
}

void mouseDragged () {
  positions.add(new PVector(mouseX, mouseY));
  sizes.add(100);
}
