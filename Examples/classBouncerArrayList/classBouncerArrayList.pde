ArrayList<Bouncer> bouncyBoiz = new ArrayList<Bouncer>();

void setup(){
  //fullScreen();
  size(800, 600);

}

void draw(){
 background(50); 
 for(Bouncer b : bouncyBoiz){
   b.bounce();
 }

}

void mouseDragged(){
  bouncyBoiz.add(new Bouncer(mouseX, mouseY, random(-.5, .5), random(-7, -10)));
  
}
