class Bomb {
  float bx;
  float by;
  float damageRadius;
  float drawRadius;
  int timeCreated;
  int fuseTime;
  boolean exploded = false;
  int timeleft;
  boolean showExplosion = false;
  color c;

  Bomb(float _x, float _y) {
    bx = _x;
    by = _y;
    damageRadius = 75;
    drawRadius = 18;
    timeCreated = millis();
    fuseTime = 3000;
    c = color(60);
  }

  void display() {
    textAlign(CENTER, CENTER);
    fill(c);
    circle(bx, by, drawRadius*2);
    fill(255);
    text(timeleft, bx, by);
    if (showExplosion) {
      fill(255, 0, 0);
      circle(bx, by, damageRadius * 2);
    }
  }

  void logic(float px, float py) {
    timeleft = (timeCreated + fuseTime - millis())/1000;
    if (millis() >= timeCreated + fuseTime && showExplosion == true) {
      exploded = true;
    }

    if ( millis() >= timeCreated + fuseTime && !exploded) {
      showExplosion = true;
      if (circleCircle(bx, by, damageRadius, px, py, 25)) {
        action();
      }
    }
  }

  void action() {
    playerBlind = true;
  }
}
