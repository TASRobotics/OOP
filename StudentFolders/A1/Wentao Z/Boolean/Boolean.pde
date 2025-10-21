float a;
float b;
float bspeed;
float[] x= new float[100];
float[] d= new float[100];
float[] y= new float[100];
float yspeed;
boolean moving;



void setup() {
  size(800, 600);
  for (int i=0; i<100; i=i+1) {
    x[i]=random(width);
    y[i]=random(height);
    d[i]=random(40);
  }
}


void draw() {
  background(50);
  for (int i=0; i<100; i=i+1) {
    circle(x[i], y[i], d[i]);
    y[i]=y[i]+yspeed;
    if (y[i]>640) {
      y[i]=-40;
      if(y[i]>640){
        y[i]=-40;
      }
    }
    if(moving==true){
      
  yspeed=d[i]/5;
}
  }
}
  




void keyPressed() {
  if (key == ' ') {
    yspeed = 5;
    moving = true;
  }
}

void keyReleased() {
  if (key == ' ') {
    yspeed = 0;
    moving = false;
  }
}
