class BigBoy extends Enemy {
  BigBoy() {
    super();
    c = color(255, 255, 0);
    d = 100;
    HP = 2;
    damage = 4;
  }

  void display() {
    fill(c);
    rectMode(CENTER);
    square(pos.x, pos.y, d);
  }


}
