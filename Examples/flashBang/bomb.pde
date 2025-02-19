class Bomb {
  float x;
  float y;
  float damageRadius;
  float drawRadius;
  int timeCreated;
  int fuseTime;
  boolean exploded = false;
  int timeleft;
  boolean showExplosion = false;

  Bomb(float _x, float _y) {
    x = _x;
    y = _y;
    damageRadius = 75;
    drawRadius = 18;
    timeCreated = millis();
    fuseTime = 3000;
  }

  void display() {
    textAlign(CENTER, CENTER);
    fill(0);
    circle(x, y, drawRadius*2);
    fill(255);
    text(timeleft, x, y);
    if(showExplosion){
      fill(255, 0, 0);
      circle(x, y, damageRadius * 2);
    }
  }

  void logic(float px, float py) {
    timeleft = (timeCreated + fuseTime - millis())/1000;
    if(millis() >= timeCreated + fuseTime && showExplosion == true){
      exploded = true;
    }
    
    if( millis() >= timeCreated + fuseTime){
      showExplosion = true;
     if(circleCircle(x, y, damageRadius, px, py, 25)){
       playerBlind = true;
     }
    }
  }
}
