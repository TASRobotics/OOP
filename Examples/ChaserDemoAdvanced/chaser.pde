class Chaser {
 float x, y, xdif, ydif, speedfactor; 
 float normx, normy; //these are for the normalized values of x and y (x^2 + y^2 = 1)
 //the normalized values are used to accelerate 
 float cx = 0; //cx and cy are used both to move toward the player and to modify acceleration
 float cy = 0;
 float r = 25;
 float accel; //lower is faster accel
 
 Chaser(float xx, float yy, float sf){
   x = xx; 
   y = yy;
   speedfactor = sf*1.5;
   accel = random(.5, 5); //lower is faster accel
 }
  
  void uas(){
    //calucate the x and y differences and the hypotenuse 
    xdif = mouseX - x;
    ydif = mouseY - y;
    float d = dist(x, y, mouseX, mouseY);
    normx = xdif / d; //divide the dif by the hypotenuse to get normalized value
    normy = ydif / d;
    
    cx += (normx/accel); //divide normalized value by acceleration factor
    cy += (normy/accel); //dividing by smaller number -> higher change -> faster
    x += cx; //update x based on change in x
    y += cy;
    x +=  (normx * speedfactor); //also move the chaser in a normalized direction towards the player
    y += (normy * speedfactor); //this prevents the acceleration from catapulting the chasers too far
    stroke(255);
    
    noStroke();
    fill(80);
    ellipse(x, y, r*2, r*2);
    /*
    float futureX = x;
    futureX += cx*25;
     float futureY = y;
    futureY += cy*25;
    line(x, y, futureX, futureY);
    
    */
    
  }
}
