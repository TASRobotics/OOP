ArrayList<Bouncer> bounceyboiz = new ArrayList<Bouncer>();
int numBouncers = 30;
void setup() {
  //fullScreen();
  size(800, 600);
  for (int i = 0; i < numBouncers; i++) {
    bounceyboiz.add(new Bouncer());
  }
  background(50);
}

void draw() {
  //background(50);
  for (int i = 0; i < numBouncers; i++) {
    bounceyboiz.get(i).display();
    bounceyboiz.get(i).move();
  }
}

void keyPressed(){
   for (int i = 0; i < numBouncers; i++) {
     bounceyboiz.get(i).randomizeColor();
   }
}
