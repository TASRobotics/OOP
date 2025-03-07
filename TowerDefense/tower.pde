class Tower {
  PVector pos;
  float range;
  float fireRate;
  float lastShot;

  Tower(float x, float y) {
    pos = new PVector(x, y);
    range = 150;
    fireRate = 1; 
    lastShot = millis();
  }

  void display() {
    fill(10,10,10);
    rect(pos.x, pos.y, 40, 40);
  }

  void shoot(ArrayList<Enemy> enemies, ArrayList<BlueEnemy> blueEnemies) {
    if (millis() - lastShot > 1000 / fireRate) {
      for (Enemy e : enemies) {
        if (dist(pos.x, pos.y, e.pos.x, e.pos.y) < range) {
          e.HP--;
          if (e.HP <= 0) e.removeme = true;
          lastShot = millis();
          break;
        }
      }
      for (BlueEnemy be : blueEnemies) {
        if (dist(pos.x, pos.y, be.pos.x, be.pos.y) < range) {
          be.HP--;
          if (be.HP <= 0) be.removeme = true;
          lastShot = millis();
          break;
        }
      }
    }
  }
}
