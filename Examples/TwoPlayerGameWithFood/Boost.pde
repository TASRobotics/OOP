class Boost {
  float x, y, s;
  
  Boost(){
   x = random(width);
   y = random(height);
   s = 20;
  }
  
  void show(){
   fill(255, 0, 255);
   ellipse(x, y, s, s); 
  }
  
}
