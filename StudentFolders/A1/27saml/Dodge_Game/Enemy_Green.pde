

class Green {
  float yspeed = 4;
  float xspeed;
  float ypos = 25;
  float xpos;
  float gr = 20; //green radius

  Green() {
    xpos = random(25, 775);
    xspeed = random(-8, 8);
    ypos = random(25,50);
  }

  void display() {
    fill(0, 150, 100);
    circle(xpos, ypos, gr*2);
  }

  void move() {
    ypos += yspeed;
    xpos += xspeed;
    if (ypos > height+gr) {
      ypos = 0;
      xpos = random(25, 775);
    }
    if (xpos > width+gr) {
      ypos = 0;
      xpos = random(25, 775);
    }
  }
}
