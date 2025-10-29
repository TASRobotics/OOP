class Enemy {
  float x, y, d;
  boolean isEnemyRed;
  color c;
  float speed;

  Enemy() {
    x = random(100, width-100);
    y = -50;
    d = 80;
    speed = 1;
    if (random(0, 100) < 50) {
      isEnemyRed = true;
      c = color(255, 0, 0);
    } else {
      isEnemyRed = false;
      c = color(0, 255, 0);
    }
    
   
  }
  
  void moveanddraw(){
    fill(c);
    circle(x, y, d);
    y = y + speed;
    println(x + " " +y);  
  }
  
 
}
