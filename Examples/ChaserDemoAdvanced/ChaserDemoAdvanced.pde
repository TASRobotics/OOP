Player p;                         //player object
ArrayList<Chaser> c;              //arraylist of chasers (we have 2+ chasers)
boolean backgroundChange = false; //this will change the background when the player is touching a chaser
int numchasers = 2;               //starting number of chasers
boolean showLines = false;        //true will display a line from player to each chaser

void setup(){
  fullScreen();
  //size(1000, 800);
  c = new ArrayList<Chaser>(); //initialize chaser arraylist
  p = new Player(25);          //make a new player with radius of 25
  
  c.add(new Chaser(25, height-25, 8)); //add starting chasers to list
  c.add(new Chaser(width-25, 25, 10)); //(x, y, speed)
}

void draw(){
  backgroundChange = !p.touching; //background change is true when not touching
  if(backgroundChange){
  background(0);
  } else {
    background(150, 20, 20);
  }
  for(Chaser temp : c){ //for all Chasers in 'c', create a temp chaser
    temp.uas(); //then update and show the temp chasers
  }
  p.play(); //run the players 'play' method (combination of update and display)
  p.score += numchasers; //increase the players score by the number of chasers
}

void mousePressed(){
  int r = (int)random(0, 4); //generate a random int from 0-3
  numchasers++; //increase the number of chasers
  if(r == 0){ //these if statements use the random number spawn in a random corner
    c.add(new Chaser(25, 25, random(8, 10)));
  }
  if(r == 1){
    c.add(new Chaser(width-25, 25, random(8, 10)));
  }
  if(r == 2){
    c.add(new Chaser(width-25, height-25, random(8, 10)));
  }
  if(r == 3){
    c.add(new Chaser(25, height-25, random(8, 10)));
  }
}

void keyPressed(){
 if(key == ' '){
   c.clear();
   c.add(new Chaser(25, height-25, 8)); //add starting chasers to list
   c.add(new Chaser(width-25, 25, 10)); //(x, y, speed)
   p.score = 0;
   numchasers = 2;
 }
  
}
