void setup() {
  size(800, 600);
  rectMode(CENTER);
}

void draw() {
  background(0);

  stroke(255);
  strokeWeight(2);

  if (mouseX > 400 - 100 && mouseX < 400 + 100 &&
      mouseY > 300 - 100 && mouseY < 300 + 100) {
    fill(255); 
  } else {
    fill(255, 0, 0); 
  }

  rect(400, 300, 200, 200);//rectangle
}
