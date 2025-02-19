class Bouncer {
  float x;
  float y;
  float d = 10;
  float cy;
  float cx;
  float g = 0.2;
  float energyLoss = .75;

  Bouncer(float newx, float newy, float newcx, float newcy) {
    x = newx;
    y = newy;
    cx = newcx;
    cy = newcy;
  }

  void bounce() {
    circle(x, y, d);
    y += cy;
    x += cx;
    cy += g;
    if (y >= height - (d/2)) {
      y = height - (d/2);
      cy = -(cy*energyLoss);
      if (cy <= 1 && cy >= -1) {
        cy = 0;
      }
    }

    if (x >= width - (d/2) || x <= (d/2)) {
      cx = -(cx * .98);
      
    }
    if (cy == 0) {
        cx = cx * 0.5;
      }
  }
}
