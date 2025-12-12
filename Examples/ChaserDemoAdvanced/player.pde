class Player {
  float r; //radius
  boolean touching; //is the player touching any chasers
  int score = 0;
  
  Player(int rr){
    r = rr;
  }
  
  void play(){ //combined function for everything the player does
    checkTouching(c); //run checkTouching function with 'c', the list of all chasers
    
    if(touching){ 
      fill(255, 0, 0); //circle is red if touching
    } else {
      fill(255, 255, 255); //otherwise its white
    }
    ellipse(mouseX, mouseY, r*2, r*2); //draw the player
    textSize(30); 
    text(score, 25, 25); //draw the score
    if(showLines){ //if the variable showLine is true
      lines(c); //run the lines function
    }
  }
  
  void lines(ArrayList<Chaser> enemies){ //the lines function takes an arraylist of chasers
    for(Chaser c : enemies){ //for each of those chasers
      stroke(60); 
      line(mouseX, mouseY, c.x, c.y); //it will draw a line from the player to the chaser
    }
  }
  
  void checkTouching(ArrayList<Chaser> enemies){
    touching = false; //start by assuming that the player is not touching any
    for(Chaser c : enemies){ //check all chasers
      if(dist(c.x, c.y, mouseX, mouseY ) < c.r + r){ //if theyre touching
        touching = true; //set touching to true
        score -= 50; //subtract 50 points
      }
    }
  }
}
