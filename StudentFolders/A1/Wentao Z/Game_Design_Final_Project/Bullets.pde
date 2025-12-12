
class Bullet{
  
  PVector pos;
PVector vel;
  int size;
  float hue;
  boolean explode;
  boolean burst;
  PImage img;
  float angle;
  Bullet(float x, float y, PVector direction){

 
    pos = new PVector(x,y);
    vel = direction.copy();
    size = 10;
    hue = random(360);
    explode = false;
     angle = atan2(vel.y, vel.x);
    burst = false;
    //img = loadImage("Bullet.png");
    //img.resize(20, 20);
  }
  
  
  Bullet(float x, float y, PVector direction, int s){
    pos = new PVector(x,y);
    vel = direction.copy();
    size = s;
    hue = random(360);
    explode = false;
    angle = atan2(vel.y, vel.x);
    //img = loadImage("Bullet.png");
    //img.resize(20, 20);
  }
  
  void display(){
    circle(pos.x, pos.y, size);
    //imageMode(CENTER);
    //image(img,pos.x,pos.y);
    if(!explode){
    //displayLaser();
        circle(pos.x, pos.y, size);
    noStroke();
    for (int i = 5; i >= 1; i--) {
      fill(hue, 100, 100, i * 10);  
      circle(pos.x, pos.y, size + i * 3);
      //displayLaser();
    }
    }
  }
  
  
  void shoot(){
    pos.add(vel);
    
    
  }
  
void update(){
  if (pos.x - size/2 < 0 || pos.x + size/2 > width || pos.y - size/2 <0 || pos.y+size/2>height) {
   explode = true;
  }
}
 


    
    
  void displayLaser() {
  pushMatrix();
  translate(pos.x, pos.y);
  rotate(angle + HALF_PI);   
  noStroke();

  colorMode(HSB, 360, 100, 100, 255);

  int p = 2; 


  fill(180, 0, 100);
  rect(-p, -6*p, p*2, 12*p);


  fill(180, 70, 100);
  rect(-2*p, -6*p, p, 12*p);
  rect( p,  -6*p, p, 12*p);


  fill(180, 40, 100, 150);
  rect(-3*p, -5*p, p, 10*p);
  rect( 2*p, -5*p, p, 10*p);


  fill(180, 0, 100);
  rect(-p, -7*p, p*2, p);

  fill(180, 50, 100, 120);
  rect(-p, 6*p, p*2, p);
  rect(-p, 7*p, p*2, p);

  popMatrix();
}

  
  
  
}
