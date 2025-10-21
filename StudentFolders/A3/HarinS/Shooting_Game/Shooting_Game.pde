ArrayList<PVector> positions = new ArrayList<PVector>();
PVector target = new PVector (500, 100);
int score = 0;
void setup(){
  size(800,600);
}

void draw(){
  background(50);
  for (int i = 0; i < positions.size(); i++){
    positions.get(i).y -= 5;
    circle(positions.get(i).x, positions.get(i).y, 10);
    if (pointCircle(positions.get(i).x, positions.get(i).y, target.x, target.y, 50) == true){
      score++;
      positions.remove(i);
    }
    else if (positions.get(i).y < 0){
      positions.remove(i);
    }
  }
  circle(target.x, target.y, 100);
  textSize(40);
  text(score, 100, 100);
}

void mousePressed(){
  positions.add(new PVector(mouseX,mouseY));
}
