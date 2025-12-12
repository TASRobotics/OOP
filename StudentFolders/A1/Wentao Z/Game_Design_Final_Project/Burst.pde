class Burst extends Bullet{
   Burst(float x, float y, PVector direction) {
    super(x, y, direction);
       pos = new PVector(x,y);
    vel = direction.copy();
    vel.mult(5);
    size = 10;
    hue = random(360);
    explode = false;
  }

  Burst(float x, float y, PVector direction, int s) {
    super(x, y, direction, s); 
  }
  
  
}
