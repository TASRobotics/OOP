PVector pos, target, vel, acc;

void setup(){
  //fullScreen();
  size(800, 600);
  pos = new PVector(100, 100);
  vel = new PVector(0, 0);
  acc = new PVector(0, 0);
}

void draw(){
 background(50); 
 target = new PVector(mouseX, mouseY);
 vel = PVector.sub(target, pos).setMag(5);
 //acc = PVector.sub(target, pos);
 //acc = acc.setMag(0.5);
 //vel.add(PVector.sub(target, pos).setMag(0.05));
  //if(vel.mag() > 5){
  //  vel.setMag(5);
  //}
 
 pos.add(vel);
 //vel.add(acc);
 
 circle(pos.x, pos.y, 20);
 circle(target.x, target.y, 20);
}
