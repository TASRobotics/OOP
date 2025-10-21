float x = 400;
float y = 450;
float yspeed = 0;

void setup(){
  size(800,600);
  x = random(50, 750);
}

void draw(){
  background(50);
  circle(x, y, 20);
  y = y + yspeed;
  if(y < -25){
    y = 450; 
  }
  
}

void keyPressed(){
  if(key == ' '){
    yspeed = -10;
    
    
  }
}
    
