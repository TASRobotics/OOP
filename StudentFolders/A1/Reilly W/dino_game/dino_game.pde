Dino d;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
boolean gameOver = false;
void setup() {
  size(800, 600);
  d = new Dino();
  obstacles.add(new Obstacle());
  
}


void draw() {
  if(!gameOver){
    mainGame();
  }else{
   gameOver(); 
  }
  background(150);
  d.update();
  d.display();

  for (int i =0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.move();
    o.display();
  }
  if () {
    obstacles.add(new Obstacle());
  }
  //println(obstacles.get(0).Opos.y);
}


void keyPressed() {
  if (key == ' ') {
    d.jump();
  }
  
}
void gameOver(){
    textSize(50);
    textAlign(CENTER, CENTER);
    text("GGS U DED", width/2, height/2);
    
}
  
void mainGame(){
  
  
}
