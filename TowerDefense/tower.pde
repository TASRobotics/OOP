class Tower {
  PVector pos;
  int damage;
  float range;
  int fireRate;
  color laserColor = color(255, 0, 0);
  boolean canFire = true;
  int lastFired = -999;

  Tower(float x, float y) {
    pos = new PVector(x, y);
    damage = 1;
    range = 200;
    fireRate = 20;
  }

  void display() {
    fill(#B77137);
    circle(pos.x, pos.y, 40);
  }

  void defend(ArrayList<Enemy> es) {
    int closest = 0;
    float minDistance= 9999;
    
    for (int i = 0; i < es.size(); i++) {
      Enemy e = es.get(i);
      if (i == 0) {
        minDistance = dist(pos.x, pos.y, e.pos.x, e.pos.y);
      }
      float d = dist(pos.x, pos.y, e.pos.x, e.pos.y);
      if (d < minDistance) {
        minDistance = d;
        closest = i;
      }
    }
    if (es.size() > 0) {
      Enemy closesty = es.get(closest);
      if (dist(closesty.pos.x, closesty.pos.y, pos.x, pos.y) < range && canFire) {
        fill(laserColor);
        line(closesty.pos.x, closesty.pos.y, pos.x, pos.y);
        closesty.HP -= damage;
        canFire = false;
        lastFired = frameCount;
      }
    }
    if(frameCount - lastFired > fireRate){
      canFire = true;
    }
    
    
  }
}
