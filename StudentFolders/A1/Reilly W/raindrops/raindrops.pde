float[] x = new float [100];
float [] y = new float [100];
float[] o = new float[100];

//float x = 400;
//float y = 50;
  
void setup(){
 size( 800, 600);
 for (int i = 0; i < 100; i ++){
   x[i] = random(50, 750);
   y[i] = random(-100, 550);
   o[i] = random(30, 120);
 }
}
void draw(){
 background(255);
 
 for (int i=0; i<100; i ++) {
   drawRaindrop(x[i], y[i], o[i]);
   y[i] += 15;
 if(y[i]>height+75){
   y[i] = -35;
   x[i] = random(-50, 850);
   
 }
 
 
 }
 
}

void drawRaindrop(float x, float y, float op){
  noStroke();
  fill(0, 200, 255, op);
  circle(x, y, 50);
  triangle(x, y-60,x - 25, y-5, x+25, y-5);
}
