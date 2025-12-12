class HomingBullet extends  Bullet {
  PVector target;
  Enemy targetenemy;
  HomingBullet(float x, float y, PVector direction, Enemy enemytarget) {
    super(x, y, direction); 
    targetenemy = enemytarget;
  }

  HomingBullet(float x, float y, PVector direction, int s) {
    super(x, y, direction, s); 
  }
  
  void update(){
    if (targetenemy.dead && !explode) {
  for (int j = 0; j < 45; j++) {
    particles.add(new Particle(pos.x, pos.y, random(30, 45), size/1.5));
  }
  explode = true;
  return;
}
    PVector direction = new PVector (targetenemy.pos.x - pos.x, targetenemy.pos.y - pos.y);
    direction.normalize();
    direction.mult(5);
    //vel = direction;
    vel.lerp(direction, 0.1);
     if (targetenemy == null || targetenemy.dead) {
    explode = true;   
    return;
  }
  }
  
}
