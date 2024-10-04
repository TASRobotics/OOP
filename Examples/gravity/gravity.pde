float x, y;
float velocity = 0;
float xvel = 0;
float gravity = 0.5;

void setup(){
  //fullScreen();
  size(800, 600);
  //y = height;
  x = 50;
  y = 0;
  //frameRate = 10;
}

void draw(){
 background(50); 
 circle(x, y, 25);
 
 y = y - velocity;
 velocity = velocity - gravity;
 x += xvel;
 if(y > height){
   y = height;
   velocity = 0;
   xvel = 0;
 }
}

void keyPressed(){
 velocity = 12.5; 
 xvel = 5;
  
}
