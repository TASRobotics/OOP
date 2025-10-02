float x1, y1;
float x2, y2;
float x3, y3;

void setup() {
  size(800, 600);
  
  
  x1 = width/3;
  y1 = 0;
  
  x2 = width/2;
  y2 = 0;
  
  x3 = 2*width/3;
  y3 = 0;
}

void draw() {
  background(50);
  fill(0, 0, 255);                      
  

  circle(x1, y1+20, 40);             
  triangle(x1, y1-20, x1-20, y1+10, x1+20, y1+10);  
  y1 += 5;
  if (y1 > height) {
    y1 = 0;
  }


  circle(x2, y2+20, 40);             
  triangle(x2, y2-20, x2-20, y2+10, x2+20, y2+10);  
  y2 += 5;
  if (y2 > height) {
    y2 = 0;
  }

 
  circle(x3, y3+20, 40);             
  triangle(x3, y3-20, x3-20, y3+10, x3+20, y3+10);  
  y3 += 5;
  if (y3 > height) {
    y3 = 0;
  }
}
