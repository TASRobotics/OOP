class Button {
  float x;
  float y;
  float dia;
  int count;
  color c;
  String label;

  Button(float xx, float yy, float dd, String l) {
    x = xx;
    y = yy;
    dia = dd;
    c = color(255, 0, 0);
    label = l;
  }

  void display() {
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(c);
    circle(x, y, dia);
    fill(0);
    text(label, x, y);
  }

  boolean check() {
    if (pointCircle(mouseX, mouseY, x, y, dia/2) == true) {
      count++;
      return true;
    } else {
      return false;
    }
  }
  
  void setColor(float r, float g, float b){
    c = color(r, g, b);
  }
  
}
