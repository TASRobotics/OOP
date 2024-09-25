void setup(){
  //fullScreen();
  size(800, 600);
}

void draw(){
  if(circleRect(mouseX, mouseY, 50, 100, 100, 100, 100)){
   background(255, 0, 0); 
  } else {
   background(50); 
  }
 
  rect(100, 100, 100, 100);
  circle(mouseX, mouseY, 100);
  
  
  
}

boolean isPointInRectangle(float px, float py, float x1, float y1, float x2, float y2) {
  // Check if the point is within the bounds of the rectangle
  return (px >= x1 && px <= x2 && py >= y1 && py <= y2);
}
