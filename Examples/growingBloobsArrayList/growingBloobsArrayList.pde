ArrayList<Blooby> bloobs;

void setup(){
  size(800, 600);
  //fullScreen();
  bloobs = new ArrayList<Blooby>();
  
}

void draw(){
  background(45);
  for(Blooby b : bloobs){
    b.update();
    b.show();
  }
}
  
void mouseDragged(){
  bloobs.add(new Blooby(mouseX, mouseY));
}
void mousePressed(){
  bloobs.add(new Blooby(mouseX, mouseY));
}
