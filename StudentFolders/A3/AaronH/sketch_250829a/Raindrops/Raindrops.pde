float[] x = new float[100];
float[] y = new float[100];

void setup() {
  size(800, 600);
  
  for (int i = 0; i < x.length; i++) {
    x[i] = random(width);     
    y[i] = random(-600, 0);   
  }
}

void draw() {
  background(50);
  fill(0, 0, 255);

  for (int i = 0; i < x.length; i++) {
    
    circle(x[i], y[i] + 20, 20); 
    triangle(x[i], y[i] - 10, x[i] - 10, y[i] + 5, x[i] + 10, y[i] + 5); 

 
    y[i] += 5;  

 
    if (y[i] > height) {
      y[i] = random(-200, 0);
      x[i] = random(width);
    }
  }
}
