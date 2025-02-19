class Shape {
  color c;
  int shape; //circle, square, triangle
  int size = 50;

  Shape(color _c, int _shape) {
    c = _c;
    shape = _shape;
    
  }

  void show(int i) {
    int x = i % 9;
    int y= i / 9;
    fill(c);
    if (shape == 0) {
      circle((x*60)+50, (y*60)+50, size);
    } else if (shape == 1) {
      square((x*60)+50, (y*60)+50, size);
    } else {
      tri((x*60)+50, (y*60)+50, size);
    }
  }
  void show(int x, int y) {
    fill(c);
    if (shape == 0) {
      circle(x, y, size);
    } else if (shape == 1) {
      square(x, y, size);
    } else {
      tri(x, y, size);
    }
  }
  
}
