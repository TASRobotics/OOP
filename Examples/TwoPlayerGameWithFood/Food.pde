class Food {
  float x, y, s;
  
  Food(){
   x = random(width);
   y = random(height);
   s = 30;
  }
  
  void show(){
   fill(0, 255, 0);
   ellipse(x, y, s, s); 
  }
  
}
