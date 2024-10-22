class Enemy {
  float x, y, cx; //name all variables each object needs
  int health, size;
  
  
  Enemy(float startx, float starty){ //inside the parenthesis go the variables you will set when
                                      //you construct the object (different names than line 2)
    x = startx; 
    y = starty;
    cx = -2;
    health = 100;
    size = 50;
  }

  
  
  void walk(){ 
    fill(90);
    circle(x, y, size);
    textAlign(CENTER, CENTER);
    textSize(14);
    fill(255);
    text(health, x, y);
    x += cx;

  }
  
}
