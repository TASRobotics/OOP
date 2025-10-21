PVector currentpos;
PVector target;

void setup(){
  //fullScreen();
  size(800, 600);
  currentpos = new PVector(100, 100);
  target = new PVector(500, 500);
}

void draw(){
 background(50); 
 
 PVector move = PVector.sub(target, currentpos);
 move.setMag(5);
 currentpos.add(move);
 
 circle(currentpos.x, currentpos.y, 50);
 circle(target.x, target.y, 50);
}
void keyPressed(){
  if(key == 'w'){
    target.y -= 100;
  }
   if(key == 's'){
    target.y += 100;
  }
  if(key == 'a'){
    target.x -= 100;
  }
   if(key == 'd'){
    target.x += 100;
  }
}
