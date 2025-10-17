ArrayList<PVector> points = new ArrayList<PVector>();

PVector currentpos;
PVector target;
int targetnum = 1;
float speed = 3;
PVector move;
void setup(){
  //fullScreen();
  size(800, 600);
  points.add(new PVector(100, 100));
  points.add(new PVector(100, 300));
  points.add(new PVector(500, 300));
  points.add(new PVector(200, 500));
  points.add(new PVector(900, 700));
  
  currentpos = points.get(0).copy();
  target = points.get(targetnum).copy();

}

void draw(){
 background(50); 
 circle(currentpos.x, currentpos.y, 50);
 move = PVector.sub(target, currentpos);
 move.normalize();
 move.mult(speed);
 currentpos.add(move);
 if(dist(currentpos.x, currentpos.y, target.x, target.y) < 5){
   targetnum++;
   target = points.get(targetnum).copy();
 }
 println(move);
 
}

void mousePressed(){
 points.add(new PVector(mouseX, mouseY)); 
  
}
