color[] col = {#E3FBFF, #BFF9FF, #95F5FF, #5FE6FF, #09C7EA};
int [] x1 = new int[100];
int [] y1 = new int[100];
int [] dia = new int[100];
int i = 0;
int i1 = 0;
int n = 0;
int x = 0;
int n1 = 0;
int ran = 0;

void setup() {
  size(800, 600);
  background(0);
  while (x <= width) {
    while (n <= 4) {
      fill(col[i]);
      ran = int(random(1, 30));
      noStroke();
      rect(x, 0, ran, 600);
      i = i + 1;
      n = n + 1;
      x = x + ran;
    }
    n = 0;
    i = 0;
    n1 = n1 + 1;
  }
  
  
  while (i1 <= 99){
    stroke(0);
    fill (#EDF9FF);
    x1[i1] = int(random(50,750));
    y1[i1] = int(random(50,550));
    dia[i1] = int(random(10, 50));
    circle(x1[i1], y1[i1], dia[i1]);
    i1 = i1 + 1;
  }
}

void draw() {
  
}
