class Button {
  float x;
  float y;
  float dia;
  String label;
  color c;

  Button(float xx, float yy, float dd, String l) {
    x = xx;
    y = yy;
    dia = dd;
    label = l;
  }

  void display() {
    textAlign(CENTER, CENTER);
    textSize(18);
    fill(255);
    circle(x, y, dia);
    fill(0);
    text(label, x, y);
  }

  boolean check() {
    if (pointCircle(mouseX, mouseY, x, y, dia/2) == true) {
      return true;
    } else {
      return false;
    }
  }
  
}
