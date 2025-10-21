float x = 400;
float y = 500;
float speed = 0;
boolean move = false;


void setup(){
  size(800,600);
}

void draw(){
 background(50); 
 fill(225);
 circle(x, y, 50);
 y += speed;
 if (speed > 0) {
   move = true;
 } else {
   move = false;
 }
 if (y <= -50) {
   y = 500;
   speed = 0;
   x = random(50,750);
  }
}

void keyPressed(){
  if(key == ' ' &&  move == false){
    speed = -5;
    y += speed;
  }
}
