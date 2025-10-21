PVector box = new PVector(mouseX, height -100);
float yVel = 2.5;
class Box {

  void display() {
    box.x = mouseX;
    box.y = mouseY;
    fill(137, 81, 41);
    square(box.x, box.y, 50);
  }
}

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
    } else if (dist(box.x, box.y, pos.x, pos.y) < 50) {
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
