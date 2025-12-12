float x = 400;
float y = 550;
float speed = 0;
boolean offscreen = false;

void setup(){
  size(800, 600);
}

void draw(){
 background(50); 
 circle(x, y, 20);
 y += speed;
 
 if(y < -25){
   x = random(0, 800);
   y = 550;
   speed = 0;
 } 
}

void keyPressed(){
  if(key == ' '){
    if(speed == 0){
      speed = -5;
    }
  }
}
