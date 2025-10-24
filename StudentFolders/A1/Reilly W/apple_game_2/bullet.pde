class Bullet{
  color c;
  boolean isRed = true;
  
  Bullet(){
    
    
  }
  
  void display(){
    fill(c);
    circle(mouseX, height - 150, 50);
  }
}
