
boolean task1Done = false;
boolean task2Done = false;
boolean task3Done = false;

void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  textSize(16);
}

void draw() {
  background(245);

  textSize(28);
  fill(0);
  text("TASKLY", width/2, 50);
  
  fill(task1Done ? color(150, 255, 150) : color(200, 220, 255));
  ellipse(150, 150, 80, 80);
  fill(0);
  text("Task 1", 150, 150);

  fill(task2Done ? color(150, 255, 150) : color(200, 220, 255));
  ellipse(150, 280, 80, 80);
  fill(0);
  text("Task 2", 150, 280);

  fill(task3Done ? color(150, 255, 150) : color(200, 220, 255));
  ellipse(150, 410, 80, 80);
  fill(0);
  text("Task 3", 150, 410);
  
  

  // pets
  fill(255, 220, 180);
   ellipse(500, 250, 150, 150);
  fill(0);
    text("Your Pet", 500, 250);

  // spinny w.heel
  fill(255, 255, 180);
   ellipse(650, 450, 120, 120);
     fill(0);
  text("Spin", 650, 450);
}

void mousePressed() {
  
  if (dist(mouseX, mouseY, 150, 150) < 40) {
       task1Done = !task1Done;
  }
  if (dist(mouseX, mouseY, 150, 280) < 40) {
     task2Done = !task2Done;
  }
  if (dist(mouseX, mouseY, 150, 410) < 40) {
    task3Done = !task3Done;
  }
}
