//class Apples {
//  float x;
//  float y;
//  float d;
//  color r;
//  color g;
  
//  Apples(){
//  }

//  void greenApple() {
//    y=0;
//    d=50;
//    g=255;
//    r=0;
//    x=random((0+(d/2)), (width-(d/2)));
//  }
//  void redApple() {
//    x=random((0+(d/2)), (width-(d/2)));
//    y=0;
//    d=50;
//    g=0;
//    r=255;
//  }
//  boolean offScreen() {
//    if (y>(height+(d/2))) {
//      return true;
//    } else {
//      return false;
//    }
//  }
//  void movement() {
//    y+=7.5;
//    if (offScreen()==true) {
//      y=0;
//      x=random((0+(d/2)), (width-(d/2)));
//    }
//  }
//  void display() {
//    fill(r, g, 0);
//    circle(x, y, d);
//  }
//}

float yVel = 2.5;

class Apple {
  int c;
  PVector pos;
  int score;


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
      yVel -= 0.5;
      //pos.y += (2.5 + 0.5*i);
    //} else if (dist(bullet.x, bullet.y, pos.x, pos.y) < 50) {
      //i ++;
      //pos.y = -50;
      //pos.x = random(50, width-50);
      //pos.y += (2.5 + 0.5* i);
      a.reset();
      b.reset();
      yVel += 0.5;
    }
  }

  void reset() {
    pos.y = -50;
    pos.x = random(50, width-50);
  }
}
