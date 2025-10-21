color[] rainbow = {#FAA4CE, #BF6A93, #F7077C, #FADEEC, #A22C65};
int selectedcolor;

void setup() {
  size(800, 600);
}

void draw() {
  background(50);
  fill(rainbow[selectedcolor]);
  circle(400, 300, 100);
  println(selectedcolor);
}

void keyPressed() {
  //voidpressed cant return a value
  if (key == 'a') {
    selectedcolor++;
    if (selectedcolor > 4) {
      selectedcolor = 0;
    }
  }
  //need brackets here bc cant press two keys at once)
  if (key == 's') {
    selectedcolor--;
    if (selectedcolor < 0) {
      selectedcolor = 4;
      // if key 's' is pressed, the color pattern will go backwards until it is smaller than the first number, then it will start back at the largest number (color))
    }
  }
}
