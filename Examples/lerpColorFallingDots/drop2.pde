class Drop2 {
   float x, y;
   float s;
   boolean hasStroke = false;
   Drop2(){
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
   s = map(x, 0, 800, 1, 80);
   float lerpamt = map(y, 0, width, 0, 1);
   fill(lerpColor(c, d, lerpamt));
   circle(x, y, s);
   x += 5;
   if(x > width){
     x = 0;
   }
  }
  
}
