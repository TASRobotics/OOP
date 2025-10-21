<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
Button b1;
Button b2;
Button b3;
Button b4;
int x = 400;
int y = 300;

void setup() {
  size(800, 600);
  b1 = new Button(600, 400, 50, "UP");
  b2 = new Button(600, 500, 50, "DOWN");
  b3 = new Button(550, 450, 50, "LEFT");
  b4 = new Button(650, 450, 50, "RIGHT");
=======
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
int point = 0;
int point1 = 0;
int point2 = 0;

void setup() {
  size(800, 600);
  textSize(20);
  textAlign(CENTER, CENTER);
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
}

void draw() {
  background(50);
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  b1.display();
  b2.display();
  b3.display();
  b4.display();
  fill(255);
  circle(x, y, 100);
}

void mousePressed() {
  if(b1.check() == true){
    y -= 10;
  }
  if(b2.check() == true){
    y += 10;
  }
  if(b3.check() == true){
    x -= 10;
  }
  if(b4.check() == true){
    x += 10;
=======
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  if (pointCircle(mouseX, mouseY, 400, 300, 100)) {
    fill(255, 255, 0);
  } else {
    fill(255);
  }
  circle(400, 300, 100);
  fill(0);
  text(point, 400, 300);

  if (pointCircle(mouseX, mouseY, 200, 100, 100)) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }
  circle(200, 100, 100);
  fill(0);
  text(point1, 200, 100);
  
  if (pointCircle(mouseX, mouseY, 600, 400, 100)) {
    fill(0, 255, 0);
  } else {
    fill(255);
  }
  circle(600, 400, 100);
  fill(0);
  text(point2, 600, 400);
}

void mousePressed() {
  if (pointCircle(mouseX, mouseY, 400, 300, 100)) {
    point = point + 1;
  }
  if (pointCircle(mouseX, mouseY, 200, 100, 100)) {
    point1 = point1 + 1;
  }
  if (pointCircle(mouseX, mouseY, 600, 400, 100)) {
    point2 = point2 + 1;
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  }
}
