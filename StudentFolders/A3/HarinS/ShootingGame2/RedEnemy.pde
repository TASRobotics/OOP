class RedEnemy {
  PVector pos;
  float dia, vel;
  boolean removeme;
  RedEnemy() {
    dia = 50;
    pos = new PVector(random(50,750), -100);
    vel = 2;
    
  }

  void display() {
    if (removeme == false){
    fill(255, 0, 0);
    circle(pos.x, pos.y, dia);
    }
  }

  void update() {
    pos.y += vel;
  }
}
