class EnemyBullet extends Bullet {
boolean death;
 EnemyBullet(float x, float y, PVector direction) {
    super(x, y, direction); 
    death = false;
  }
  
  void display(){
    if(!explode){
    circle(pos.x, pos.y, size);
    noStroke();
    for (int i = 5; i >= 1; i--) {
      fill(0, 100, 100, i * 10);  
      circle(pos.x, pos.y, size + i * 3);
    }
    }
    
     
  }
   
 
  
}
