class Bullet {
  float x, y, cx, cy;
  //0 is red, 1 is green
  int type;
  color c;
  boolean removeme = false;
 
  Bullet(float startx, float starty, int t) {
    x = startx;
    y = starty;
    cx = 10;
    cy = 10;
    type = t;
    if(type == 0){
      c = color(255, 0, 0);
    } else {
      c = color(0, 255, 0);
    }
  }
  void shoot() {
    fill(c);
    if (removeme == false){
      circle(x, y, 20);
      y -= cy;
    }
  }
}
