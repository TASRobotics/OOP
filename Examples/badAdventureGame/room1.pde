void screen1() {
  // Rectangle 1
  fill(255, 165, 0); // Bright Orange
  rect(150, 120, 180, 90); // x, y, width, height

  // Rectangle 2
  fill(75, 0, 130); // Indigo
  rect(350, 250, 140, 120);

  // Rectangle 3
  fill(0, 255, 255); // Cyan
  rect(500, 100, 200, 150);

  // Rectangle 4
  fill(255, 20, 147); // Deep Pink
  rect(600, 400, 160, 90);
  checkIfPlayerIsTouchingSword();
  if(!playerHasSword){
   drawSwordOnFloor(); 
  }


  if (x < 0) {
    screen = 0;
    x = 800;
  }
  if (y < 0) {
    y = 0;
  }
}

void checkIfPlayerIsTouchingSword(){
  if(circleRect(x, y, 25, 40, 10, 20, 60)){
    playerHasSword = true;
  }
  
}
