PImage dino;
float dx, dy, dv, jumpspeed;
float ex, ey, es;
boolean currentlyJumping = false;

void setup(){
  //fullScreen();
  size(1200, 600);
  dino = loadImage("dino.png");
  dino.resize(100, 0);
  dx = 25;
  dy = 500;
  dv = 0;
  jumpspeed = -5;
  ex = 1180;
  ey = 550;
  es = 5;
}

void draw(){
 background(200); 
 image(dino, dx, dy);
 dy += dv;
 if(dy < 400){
   dv = -dv;
 }
 if(dy >= 500){
   dv = 0;
   dy = 500;
   currentlyJumping = false;
 }
 
 rect(ex, ey, 50, 50);
 ex -= es;
}

void keyPressed(){
  println(dino.height);
  if(key == ' ' && currentlyJumping == false){
    dv = jumpspeed;
    currentlyJumping = true;
  }
  
}
