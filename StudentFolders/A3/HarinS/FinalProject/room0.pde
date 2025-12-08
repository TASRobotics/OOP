void screen0() {

  //door red
  if (done1 == false) {
    fill(255, 0, 0);
    rect(200, 200, 100, 150);
  }

  //door green
  fill(0, 255, 0);
  rect(350, 200, 100, 150);

  //door blue
  if (done == false) {
    fill(0, 0, 255);
    rect(500, 200, 100, 150);
  }
}
