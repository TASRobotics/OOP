class Drop {
   float x, y;
   float s;
   boolean hasStroke = false;
   Drop(){
     x = mouseX;
     y = mouseY;
     s = 0;
    float r = random(0, 100);
    if(r < 10){
      hasStroke = true;
    } 
   }

  void uad(){
   stroke(255, 80);
   fill(255);
   s = map(y, 0, 600, 1, 80);
   float lerpamt = map(x, 0, width, 0, 1);
   fill(lerpColor(a, b, lerpamt));
   circle(x, y, s);
   y += 5;
   if(y > height){
     y = 0;
   }
  }
  
}
