class Tower {
  PVector pos;
  ArrayList<Bullet> projectiles;
  
  Tower(float x, float y){
    pos = new PVector(x, y);
    projectiles = new ArrayList<Bullet>();
  }
  
  
  void display(){
    rectMode(CENTER);
    rect(pos.x, pos.y, 20, 20);
    
    for(Bullet b : projectiles){
      b.uad();
    }
  }
  
  void fire(float x, float y){
    projectiles.add(new Bullet(pos.x, pos.y, x, y));
    
  }
  
}
