color[][] answer = new color[4][4];
boolean showc = true;
boolean colorsSet = false;
boolean done = false;

int x;
int y;
int came;
int duration = 3000;

int score = 0;
int mistake = 4;

void bluedoor() {
  fill(255);
  textSize(50);
  text("MEMORIZE", 500, 200);
  text("THE BLUE", 500, 250);
  text("TILES!", 500, 300);
  text("Score:", 500, 375);
  fill(255, 0, 0);
  text("Game Over in:", 500, 475);
  textSize(100);
  text(mistake, 650, 550);
  fill(255);
  text(score, 650, 400);
  if (score >= 4) {
    background(50);
    done = true;
    drawKeyG();
  }

  if (!done) {
    if (showc && !colorsSet) {
      generateColors();
      copyPattern();
      came = millis();
      colorsSet = true;
    }

    if (showc && millis() > came + duration) {
      showc = false;
      turnWhite();
    }

    drawGrid();
  }
}



void generateColors() {
  int c1count = 0;

  while (c1count < 4) {
    x = int(random(4));
    y = int(random(4));
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
}

void copyPattern() {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      answer[i][j] = colors[i][j];
    }
  }
}

void turnWhite() {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      colors[i][j] = color(255);
    }
  }
}

void drawGrid() {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      fill(colors[i][j]);
      rect(110 + 100*i, 110 + 100*j, 80, 80);
    }
  }
}


int redx = 300;
int redy = 200;
int redxs = 30;
int redys = 30;
int stopfor = 500;
int stopped;
boolean blueon = false;
boolean greenon = false;
boolean redon = false;
boolean yellowon = false;
boolean stop = false;
boolean jigsaw = false;


void pieceSetup() {
  
  Piece[] pieces = new Piece[4];
  Piece selected = null;
  
  pieces[0] = new Piece(50, 50, 100, 100, color(255, 0, 0));
  pieces[1] = new Piece(250, 50, 100, 100, color(0, 255, 0));
  pieces[2] = new Piece(50, 250, 100, 100, color(0, 0, 255));
  pieces[3] = new Piece(250, 250, 100, 100, color(255, 255, 0));
}
void reddoor() {
  if (jigsaw == false) {
    fill(255);
    circle(redx, redy, 50);
    if (stop == false) {
      redx += redxs;
      redy += redys;
      if (redx >= 600 || redx <= 200) {
        redxs = -redxs;
      }
      if (redy >= 400 || redy <= 200) {
        redys = -redys;
      }
    }
    if (stop) {
      if (millis() > stopped + stopfor) {
        stop = false;
      }
    }
    if (redon && !jigsaw) {
      fill(255, 0, 0);
      rect(0, 0, 400, 300);
      fill(100, 0, 0);
      textSize(100);
      text(str(password1), 100, 100);
    }
    if (yellowon && !jigsaw) {
      fill(255, 255, 0);
      rect(400, 0, 400, 300);
      fill(100, 100, 0);
      textSize(100);
      text(str(password2), 500, 100);
    }
    if (blueon && !jigsaw) {
      fill(0, 0, 255);
      rect(0, 300, 400, 300);
      fill(0, 0, 100);
      textSize(100);
      text(str(password3), 100, 400);
    }
    if (greenon && !jigsaw) {
      fill(0, 255, 0);
      rect(400, 300, 400, 300);
      fill(0, 100, 0);
      textSize(100);
      text(str(password4), 500, 400);
    }
    if (redon && yellowon && greenon && blueon) {
      fill(200);
      rect(300, 275, 200, 50);
      fill(0);
      textSize(50);
      text("Next", 350, 320);
    }
  }
  if (jigsaw) {
    for (Pieces p : pieces) {
    p.show();
  }
  }
}

class Pieces {
  float x, y, w, h;
  color c;
  boolean dragging = false;
  float offsetX, offsetY;
  Pieces (float x, float y, float w, float h, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
  }

  void show() {
    fill(c);
    rect(x, y, w, h);
  }

  boolean over(float mx, float my) {
    return mx >= x && mx <= x + w &&
           my >= y && my <= y + h;
  }

  void startDrag(float mx, float my) {
    dragging = true;
    offsetX = mx - x;
    offsetY = my - y;
  }

  void drag(float mx, float my) {
    if (dragging) {
      x = mx - offsetX;
      y = my - offsetY;
    }
  }

  void stopDrag() {
    dragging = false;
  }
}
