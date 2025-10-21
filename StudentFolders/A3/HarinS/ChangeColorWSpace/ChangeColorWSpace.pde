color[] col = {#43ACFF, #12E0B9, #9274F0, #8BACED, #8BEDA7};
int i = 0;

void setup() {
  size(800, 600);
}

void draw() {
  background(0);

  fill(col[i]);
  circle(400, 300, 100);
}

void keyPressed() {
  if (key == ' ') {
    i = i + 1;
    if (i >= col.length - 1) {
      i = 0;
    }
  }
}
