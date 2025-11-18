

class Purple {
  float yspeed = 3;
  float ypos = 25;
  float xpos;
  float pr = 20; //purple radius

  Purple() {
    xpos = random(25, 775);
  }

  void display() {
    fill(150, 0, 200);
    circle(xpos, ypos, pr*2);
  }

  void move() {
    ypos += yspeed;
    if (ypos > height+pr) {
      ypos = 0;
      xpos = random(25, 775);
    }
  }
}
