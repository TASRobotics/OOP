ArrayList<PVector> bpos = new ArrayList<PVector>();
PVector shippos = new PVector(400, 550);
void setup(){
  //fullScreen();
  size(800, 600);
  
  
}

void draw(){
  background(50); 
  println(bpos.size());
  circle(shippos.x, shippos.y, 40);
  shippos.x = mouseX;
  
  for(int i = 0; i < bpos.size(); i++){
    //circle(bpos.get(i).x, bpos.get(i).y, 10);
    //bpos.get(i).y -= 5;
    PVector temp = bpos.get(i);
    circle(temp.x, temp.y, 10);
    temp.y -= 5;
  }
}

void keyPressed(){
  if(key == ' '){
    bpos.add(new PVector(shippos.x, shippos.y));
  }
}
