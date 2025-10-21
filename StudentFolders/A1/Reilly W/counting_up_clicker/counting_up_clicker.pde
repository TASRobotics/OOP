ClickMe kingston;

void setup(){
  size(800, 600);
  kingston = new ClickMe();
}

void draw(){
  kingston.display();
}


void mousePressed(){
 if(dist(mouseX, mouseY, width/2, height/2) < 50){
   kingston.c ++;
 }
  
}
