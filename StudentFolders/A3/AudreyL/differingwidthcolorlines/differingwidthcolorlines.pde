color[] rainbow = {#FAA4CE, #BF6A93, #F7077C, #FADEEC, #A22C65};
int selectedcolor;


void setup() {
  size(800, 600);
}

void draw() {
  background(50);
  fill(rainbow[selectedcolor]);
  println(selectedcolor);

  int i = 4;
  //start color = color number 5
  float a = 0;
  while (a < width) {
    fill(rainbow[i]);
    float w = random(5, 50);
    rect(a, 0, w, 600);
    a = a + w;
    //make new variable w, meaning the rectangle width will be randomly generated each time
    //width of column
    if (i > 4) {
      i = i + 1;
      i = 0;
      // after the colorselecter goes past the fifth color, it'll go back to the 1st color (0)
    }
  }
}
