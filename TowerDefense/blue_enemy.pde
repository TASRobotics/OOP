class BlueEnemy extends Enemy {
  
  BlueEnemy() {
    super();
    this.HP = 2;
    this.c = color(0, 0, 255); 
    this.speed = 10; 
  }
  
  
  void display() {
    fill(c); 
    circle(pos.x, pos.y, d);
  }
}
