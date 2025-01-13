int numSides = 3;


void setup(){
  //fullScreen();
  size(800, 600);
  
 
}

void draw(){
  numSides = (int)map(mouseX, 0, width, 3, 20);
  float radius = map(mouseY, 0, height, 10, 100);
  
 background(250); 
  PVector point = new PVector(0, radius);
  
  for(int i = 0; i < numSides; i++){
    PVector old = point.copy();
    point.rotate(radians(360/numSides));
    line(old.x+mouseX, old.y+mouseY, point.x+mouseX, point.y+mouseY);
  }
}
