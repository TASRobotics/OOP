void screen0() {

  // Rectangle 1
  fill(255, 0, 0); // Red color
  rect(100, 100, 150, 80); // x, y, width, height

  // Rectangle 2
  fill(0, 255, 0); // Green color
  rect(300, 200, 120, 150);

  // Rectangle 3
  fill(0, 0, 255); // Blue color
  rect(500, 350, 180, 100);

  // Rectangle 4
  fill(255, 255, 0); // Yellow color
  rect(650, 50, 100, 50);
  
  if(x > 800){
    screen = 1;
    x = 0;
  }
}
