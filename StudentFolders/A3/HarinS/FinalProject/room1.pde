void screen1() {
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
  
  if(!playerHasKeyR){ // Only draw sword if player hasn't collected it
   drawKeyR(); // Draw red key on the floor
     keyrx += keyrxs;
     keyry += keyrys;
     if (keyrx >= 740 || keyrx <= 20){
       keyrxs = -keyrxs;
     }
     if (keyry >= 585 || keyry <= 10){
       keyrys = -keyrys;
     }
  }
}
