void setup(){
  size(800,600);
  fill(0,255,0);
 
}

void draw(){
  if (mouseX > 400 && mouseY < 300) {
    background (0);
  }
  else if (mouseX < 400 && mouseY < 300){
    background (255);
  }
  else if (mouseX < 400 && mouseY > 300){
    background(0,0,255);
  }
  else if (mouseX > 400 && mouseY > 300) {
    background(255,0,0);
  }
  line(400, 0, 400, 600);
  line(0, 300, 800, 300);
}
