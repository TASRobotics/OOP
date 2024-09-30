float y;
float velocity = 0;
float gravity = 0.5;

void setup(){
  //fullScreen();
  size(800, 600);
  //y = height;
  y = 0;
  //frameRate = 10;
}

void draw(){
 background(50); 
 circle(400, y, 25);
 
 y = y - velocity;
 velocity = velocity - gravity;
 
 if(y > height){
   y = height;
   velocity = 0;
 }
}

void keyPressed(){
 velocity = 12.5; 
  
}
