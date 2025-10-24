PVector bullet;
class Bullet {
  ArrayList<Bullet> pewpew = new ArrayList<Bullet>();
  color c;
  float bVel = -8;

  Bullet() {
    c = color(255, 0, 0);
    bullet = new PVector(mouseX, height-100);
  }

  void shoot() {
    if (mousePressed && (mouseButton  == LEFT)) {
      c = color(255, 0, 0);
      pewpew.add(new Bullet());
      
      bullet.y += bVel;
    } else if (mousePressed && (mouseButton == RIGHT)) {
      c = color(0, 255, 0);
      pewpew.add(new Bullet());
      bullet.y += bVel;
    }
  }

  void update() {
    bullet.x = mouseX;
  }
  void display() {
    fill(c);
    circle(bullet.x, bullet.y, 10);
  }
}

class Apple {
  int c;
  PVector pos;
  int score;

  float yVel = 2.5;
  Apple(int col, float x, float y) {
    c = col;
    pos = new PVector(x, y);
    //yVel = 2.5;
    //if(c == 0)
  }


  void display() {
    if (c == 0) {
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);
    }
    circle(pos.x, pos.y, 50);


    pos.y += yVel;
    if (pos.y > width - 25) {
      //i++;
      pos.y = -50;
      pos.x = random(50, width-50);
      bullet.y = height-100;
      yVel -= 0.5;
      //pos.y += (2.5 + 0.5*i);
    } else if (dist(bullet.x, bullet.y, pos.x, pos.y) < 35) {
      //i ++;
      //pos.y = -50;
      //pos.x = random(50, width-50);
      //pos.y += (2.5 + 0.5* i);
      a.reset();
      b.reset();
      bullet.y = height-100;
      yVel += 0.5;
    }
  }

  void reset() {
    pos.y = -50;
    pos.x = random(50, width-50);
  }
}
