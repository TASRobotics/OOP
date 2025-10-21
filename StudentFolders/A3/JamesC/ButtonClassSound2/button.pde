class Button {
  float x;
  float y;
  float dia;
  int count;

  Button(float xx, float yy, float dd) {
    x = xx;
    y = yy;
    dia = dd;
  }

  void display() {
    textAlign(CENTER, CENTER);
    textSize(30);
    if (pointCircle(mouseX, mouseY, x, y, dia/2) == true) { //change color when hovered
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    circle(x, y, dia);
    fill(0);
    text(count, x, y);
  }

  boolean check() {
    if (pointCircle(mouseX, mouseY, x, y, dia/2) == true) {
      count++;
      a.play(.6);
      return true;
    } else {
      return false;
    }
  }
  
}
