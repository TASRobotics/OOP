class Bullet {
  float x, y, cx, cy; //name all variables each object needs
  
  Bullet(float startx, float starty){ //inside the parenthesis go the variables you will set when
                                      //you construct the object (different names than line 2)
    x = startx; //assign values to variables from line 2
    y = starty;
    cx = 10;
    cy = 0;
  }
  
  Bullet(float startx, float starty, float verticalchange){ 
    x = startx; //assign values to variables from line 2
    y = starty;
    cx = 10;
    cy = verticalchange;
  }
  
  void pewpew(){   //a method to draw and move the bullets
    circle(x, y, 20);
    x += cx;
    y += cy;
  }
  
}
