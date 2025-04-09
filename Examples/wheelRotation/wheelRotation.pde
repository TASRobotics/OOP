float rotamt = 0;
float rotateby = random(16, 64);

void setup(){
  //fullScreen();
  size(800, 600);
}

void draw(){
 //background(50); 
 pushMatrix();
 
 translate(400, 300);
 
 rotate(radians(rotamt));
 fill(0);
 arc(0, 0, 320, 320, 0, PI, PIE);
 fill(255);
 arc(0, 0, 320, 320, PI, TWO_PI, PIE);
 rotamt += rotateby;
 rotateby *= 0.982;
 //rotateby -= 0.001;
 if(rotateby >=0 && rotateby <= 0.05){
   rotateby = 0;
 }
 popMatrix();
 fill(255);
 triangle(390, 120, 410, 120, 400, 150);
}
