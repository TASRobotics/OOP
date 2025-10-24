class Bullet{
  color c;
  ArrayList<Bullet> pewpew = new ArrayList<Bullet>();
  PVector bullet;
  float bVel = 8;
  Bullet(float x, float y){
    c = color(255);
    bullet = new PVector(x, y);
  }
  
  void display(){
   fill(c);
   circle(bullet.x, bullet.y, 10);
  }
  void update(){
  bullet.x = mouseX;
}
  void shoot(){
   if(mousePressed  && mouseButton == LEFT){
     c = color (255, 0, 0);
     pewpew.add(new Bullet(mouseX, height- 100));
     bullet.y -= bVel;
   }else if (mousePressed && mouseButton == RIGHT){
     c = color(0, 255, 0);
     pewpew.add(new Bullet(mouseX, height - 100));
     bullet.y -= bVel;
   }
    
  }
  
}
