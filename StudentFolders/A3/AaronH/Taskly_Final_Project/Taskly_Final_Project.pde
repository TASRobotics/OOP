boolean task1Done = false;
boolean task2Done = false;
boolean task3Done = false;
int petSize = 150;
int points = 0;

boolean spinning = false;
float rotamt = 0;
float rotateby = 0;
String message = "";
color petColor;

void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  textSize(16);
  loadProgress(); 
}

void draw() {
  background(245);
  textSize(28);
  fill(0);
  text("TASKLY", width/2, 50);

  textSize(18);
  fill(50);
  text("Points: " + points, width/2, 90);

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

  if (points < 30) {
    petColor = color(255, 220, 180);
  } else if (points < 70) {
    petColor = color(180, 255, 180);
  } else {
    petColor = color(180, 200, 255);
  }

  fill(petColor);
  ellipse(500, 250, petSize, petSize);
  fill(0);
  text("Your Pet", 500, 180);
  fill(0);
  ellipse(480, 240, 10, 10);
  ellipse(520, 240, 10, 10);

  if (points < 70) {
    noFill();
    stroke(0);
    arc(500, 265, 40, 20, 0, PI);
  } else {
    fill(0);
    arc(500, 270, 40, 20, PI, TWO_PI);
  }

  pushMatrix();
  translate(650, 450);
  rotate(radians(rotamt));

  for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) {
      fill(255);
    } else {
      fill(0);
    }
    arc(0, 0, 200, 200, i * TWO_PI / 10, (i + 1) * TWO_PI / 10, PIE);
  }

  circle(0, -100, 10);
  fill(255, 0, 0);
  textSize(20);

  for (int i = 0; i < 10; i++) {
    text(i, 0, -70);
    rotate(TWO_PI/10);
  }

  popMatrix();
  fill(255, 0, 0);
  triangle(650 - 10, 450 - 110, 650 + 10, 450 - 110, 650, 450 - 80);

  fill(0);
  text("Spin", 650, 450);

  fill(255, 100, 100);
  rect(700, 20, 80, 30, 10);
  fill(0);
  textSize(16);
  text("Restart", 740, 35);

  if (message != "") {
    fill(0, 150, 0);
    textSize(18);
    text(message, width/2, 550);
  }

  if (spinning) {
    rotamt += rotateby;
    rotateby *= 0.98;

    if (rotamt > 360) {
      rotamt -= 360;
    }

    if (abs(rotateby) < 0.1) {
      spinning = false;
      rotateby = 0;

      float angle = rotamt - 15;
      if(angle < 0){
        angle += 360;
      }

      int slice = int(map(angle, 360, 0, 0, 10));

      boolean isWhite = (slice % 2 == 1);
      int gained = isWhite ? int(random(30, 80)) : int(random(10, 40));

      points += gained;
      message = (isWhite ? "White!" : "Black!") + " +" + gained + " Points!";
      saveProgress();
    }
  }
}

void mousePressed() {
  if (dist(mouseX, mouseY, 150, 150) < 40) {
    task1Done = !task1Done;
    petSize += task1Done ? 10 : -10;
    points += task1Done ? 10 : -10;
    saveProgress();
  }

  if (dist(mouseX, mouseY, 150, 280) < 40) {
    task2Done = !task2Done;
    petSize += task2Done ? 10 : -10;
    points += task2Done ? 10 : -10;
    saveProgress();
  }

  if (dist(mouseX, mouseY, 150, 410) < 40) {
    task3Done = !task3Done;
    petSize += task3Done ? 10 : -10;
    points += task3Done ? 10 : -10;
    saveProgress();
  }

  if (dist(mouseX, mouseY, 650, 450) < 80 && !spinning) {
    spinning = true;
    rotateby = 10;
    message = "";
  }

  if (mouseX > 700 && mouseX < 780 && mouseY > 20 && mouseY < 50) {
    resetProgress();
  }
}

void saveProgress() {
  String[] data = {
    str(points),
    str(petSize),
    str(task1Done),
    str(task2Done),
    str(task3Done)
  };
  saveStrings("save.txt", data);
}

void resetProgress() {
  points = 0;
  petSize = 150;
  task1Done = false;
  task2Done = false;
  task3Done = false;
  message = "Progress Reset!";
  saveProgress();
}

void loadProgress() {
  java.io.File file = new java.io.File(sketchPath("save.txt"));
  if (!file.exists()) return;

  String[] data = loadStrings("save.txt");
  points = int(data[0]);
  petSize = int(data[1]);
  task1Done = data[2].equals("true");
  task2Done = data[3].equals("true");
  task3Done = data[4].equals("true");
}
