class Bounce extends Bullet {
float health;
  boolean dead;
  Bounce(float x, float y, PVector direction) {
    super(x, y, direction); 
    health =100;
  }

  Bounce(float x, float y, PVector direction, int s) {
    super(x, y, direction, s); 
  }

  void update() {
    if (pos.x - size/2 < 0 || pos.x + size/2 > width){
        health = health -20;
        vel.x *= -1;
    }
    if (pos.y - size/2 < 0 || pos.y + size/2 > height){
      vel.y *= -1;
      health = health -20;
    }
  
    pos.add(vel);
    if(health<=0){
      dead = true;
    }
  }
}
