class ClickMe {
int c = 0;


  void display() {
    
    if (dist(mouseX, mouseY, width/2, height/2) < 50) {
      fill(150);
    } else {
      fill(50);
    }
    circle(width/2,height/2, 100);
    
    fill(255);
    textSize(25);
    textAlign(CENTER, CENTER);
    text(c, width/2, height/2);
  }
}
