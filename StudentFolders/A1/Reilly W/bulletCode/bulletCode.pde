float x = 400;
float y = 575;
float cy = 0;



void setup() {
  size(800, 600);
}

void draw() {
  background(255);
  circle(x, y, 25);
  y -= cy;
  if (y<-25) {
    cy = 0;
    y = 575;
    x = random(25, 775);
  }
}

void keyPressed() {
  if (key ==' ') {
    if (cy == 0) {
      cy = 7 ;
      
    }
  }
}
