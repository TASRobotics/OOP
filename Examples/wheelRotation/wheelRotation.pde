float rotamt = 0;
float rotateby = 5;

void setup(){
  //fullScreen();
  size(800, 600);
}

void draw(){
 //background(50); 
 pushMatrix();
 
 translate(400, 300);
 
 rotate(radians(rotamt));
 fill(0, 50);
 arc(0, 0, 320, 320, 0, PI, PIE);
 fill(255, 50);
 arc(0, 0, 320, 320, PI, TWO_PI, PIE);
 rotamt += rotateby;
 rotateby *= 0.99;
 //rotateby -= 0.001;
 if(rotateby >=0 && rotateby <= 0.05){
   rotateby = 0;
 }
 popMatrix();
 
}
