class Player{
    ArrayList<PVector> trail = new ArrayList<PVector>();
    int numTrails = 350;
  PVector pos;
  int speed;
  int size;
  int health;
Player(){
  pos = new PVector(300,400);
  speed = 5;
  size = 25;
  health = 1000;

   
   
}

void display(){
  fill(0,0,100);
  circle(pos.x,pos.y,size);
   
}
 
void trails(){
  trail.add(pos.copy());
  if (trail.size() >= numTrails) {
    trail.remove(0);
  }
  noStroke();
      int alpha = 200;
    int step = 255 / trail.size();
    for (int i = trail.size()-1; i > 0; i--) {
      PVector t = trail.get(i);
      fill(30,0,100); 
      circle(t.x,t.y,10);
      alpha -= step;
  }
  fill(0,0,100,20);
  beginShape();
  for (PVector p : trail) {
    vertex(p.x, p.y);
  }
  endShape(CLOSE); 
}
}
