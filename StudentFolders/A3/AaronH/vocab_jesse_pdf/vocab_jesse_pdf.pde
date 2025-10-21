ArrayList<PVector> positions = new ArrayList<PVector>();
PVector target = new PVector(500, 100);
int score = 0;

void setup() {
  size(800, 600);
}

void draw() {
  background(50);

  for (int i = positions.size() - 1; i >= 0; i--) {
    positions.get(i).y -= 5;
    circle(positions.get(i).x, positions.get(i).y, 10);

    if (dist(positions.get(i).x, positions.get(i).y, target.x, target.y) < 50) {
      score++;
      positions.remove(i);
      continue;
    }

    if (positions.get(i).y < 0) {
      positions.remove(i);
    }
  }

  circle(target.x, target.y, 100);
  textSize(40);
  fill(255);
  text(score, 50, 50);
}

void mousePressed() {
  positions.add(new PVector(mouseX, mouseY));
}
  
