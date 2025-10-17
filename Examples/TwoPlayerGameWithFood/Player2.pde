class Player2 {
  float x, y, s, sp;
  color c = color(0, 0, 255);
  int score = 0;
  boolean boosted = false;
  Timer reverseT;
  float dmult = 1;

  Player2() {
    x = random(width);
    y = random(height);
    s = 60;
    sp= 4;
    reverseT = new Timer(2000);
    reverseT.pause();
  }
  void rev() {
    dmult = -1;
    reverseT.reset();
    reverseT.begin();
  }
  void show() {
    reverseT.update();
    if (reverseT.fire) {
      dmult = 1;
      reverseT.fire = false;
      reverseT.pause();
    }
    if (x > width) {
      x = 0;
    } else if (x < 0) {
      x = width;
    }
    if (y > height) {
      y = 0;
    } else if (y < 0) {
      y = height;
    }
    fill(c);

    ellipse(x, y, s, s);
    textAlign(CENTER, CENTER);
    textSize(20);
    fill(255);
    text(score, x, y);
  }

  boolean eat(Food f) {
    if (dist(x, y, f.x, f.y) <= s/2 + f.s/2) {
      return true;
    } else {
      return false;
    }
  }
  boolean boo(Boost b) {
    if (dist(x, y, b.x, b.y) <= s/2 + b.s/2) {
      return true;
    } else {
      return false;
    }
  }
   boolean reverseCard(Reverse rr){
    if(dist(x, y, rr.x, rr.y) <= s/2 + rr.s/2){
      return true;
    } else {
      return false;
    }
    
  }
}
