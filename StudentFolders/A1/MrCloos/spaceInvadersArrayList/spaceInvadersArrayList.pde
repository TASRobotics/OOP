ArrayList<PVector> bpos = new ArrayList<PVector>();
PVector shippos = new PVector(400, 550);
PVector enemypos = new PVector(400, 75);
int score = 0;

void setup(){
  //fullScreen();
  size(800, 600);
  textSize(40);
  
}

void draw(){
  background(50); 
  text(score, 30, 30);
  println(bpos.size());
  circle(shippos.x, shippos.y, 40);
  circle(enemypos.x, enemypos.y, 50);
  
  shippos.x = mouseX;
 
  for(int i = 0; i < bpos.size(); i++){
    PVector temp = bpos.get(i);
    circle(temp.x, temp.y, 10);
    temp.y -= 5;
    if(circleCircle(temp.x, temp.y, 5, enemypos.x, enemypos.y, 25) == true){
      score++;
      temp.x = 1000;
      temp.y = 1000;
      enemypos.x = random(50, 750);
    }
  }
}

void keyPressed(){
  if(key == ' '){
    bpos.add(new PVector(shippos.x, shippos.y));
  }
}
