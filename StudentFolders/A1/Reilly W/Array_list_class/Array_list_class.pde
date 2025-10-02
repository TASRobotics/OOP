ArrayList<Bouncer> bounceyballs = new ArrayList<Bouncer>();
int numBalls = 15;
void setup() {
  size (800, 600);
  for (int i = 0; i < numBalls; i++) {
    bounceyballs.add(new Bouncer());
  }
  background(50);
}


void draw(){
 for( int i = 0; i < numBalls; i++){
  bounceyballs.get(i).display();
  bounceyballs.get(i).move();
   
 }
}


void keyPressed(){
 for(int i = 0; i<numBalls; i++){
   bounceyballs  .get(i).randomizeColor();
 }
}
