void screen3() {
  int came;
  int duration = 5;
  boolean showc = true;
  fill(255);
  rect(30, 285, 50, 25);
  triangle(20, 300, 50, 350, 50, 250);
      came = millis();
  if (showc) {
    int c1count = 0;
    while (c1count < 4) {
      int x = (int)random(0, 4);
      int y = (int)random(0, 4);
      if (colors[x][y] != color(255, 0, 0)) {
        colors[x][y] = color(255, 0, 0);
        c1count++;
      }
    }
    c1count = 0;
    while (c1count < 4) {
      int x = (int)random(0, 4);
      int y = (int)random(0, 4);
      if (colors[x][y] != color(0, 255, 0) && colors[x][y] != color(255, 0, 0)) {
        colors[x][y] = color(0, 255, 0);
        c1count++;
      }
    }
    c1count = 0;
    while (c1count < 4) {
      int x = (int)random(0, 4);
      int y = (int)random(0, 4);
      if (colors[x][y] != color(255, 0, 0) && colors[x][y] != color(0, 255, 0) && colors[x][y] != color(0, 0, 255)) {
        colors[x][y] = color(0, 0, 255);
        c1count++;
      }
    }

    c1count = 0;
    while (c1count < 4) {
      int x = (int)random(0, 4);
      int y = (int)random(0, 4);
      if (colors[x][y] != color(255, 255, 0) && colors[x][y] != color(0, 255, 0) && colors[x][y] != color(0, 0, 255) && colors[x][y] != color(255, 0, 0)) {
        colors[x][y] = color(255, 255, 0);
        c1count++;
      }
    }
    println(came);
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        fill(colors[i][j]);
        rect(100*i+110, 100*j+110, 80, 80);
      }
    }
  }
  if (showc && millis() > came + duration) {
    showc = false;
    fill(0);
    println(":P");
  }
}
