float x;
float y;
float dia1;
float speedy;
void setup() {
  size(800, 600);
  dia1=50;
  y=550;
  x=random(50,750);
}


void draw() {
  background(50);
  circle(x, y, dia1);
  y=y-speedy;
  if(y<-50){
    y=550;
    x=random(50,750);
    speedy=0;
  }
  
}

void keyPressed() {
  if (key==' ') {
    if (y>0) {
      speedy=10;
    }
}
}
