void setup(){
  size(800,600);
  fill(0,255,0);
 
}

void draw(){
  if (mouseX > 200 && mouseY > 200 && mouseX < 600 && mouseY < 400) {
    background (0);
  } else {
    background(255);
  }
  noFill();
  rect(200,200,400,200);
}
