import java.util.*;
import java.awt.Robot;
import java.awt.AWTException;
Robot robot;

int shapesX = 9;
int shapesY = 9;
int numShapes = shapesX * shapesY;

ArrayList<Shape> shapes = new ArrayList<Shape>();
int index = 0;

int score = 0;
int screen = 0;
int maxScore = 5;
float time;
Shape match;

void setup() {
  //fullScreen();
  size(1200, 600);
  try {
  robot = new Robot();
  } catch (AWTException e){
    e.printStackTrace();
  }

  for (int i = 0; i < numShapes; i++) {
    color col;
    int sh;
    if (i%4 == 0) {
      col = color(255, 0, 0);
    } else if (i % 4 == 1) {
      col = color(0, 255, 0);
    } else if (i % 4 == 2) {
      col = color(0, 0, 255);
    } else {
      col = color(255, 255, 0);
    }
    if (i%3 == 0) {
      sh = 0;
    } else if (i % 3 == 1) {
      sh = 1;
    } else {
      sh = 2;
    }
    shapes.add(new Shape(col, sh));
  }

  Collections.shuffle(shapes);
  rectMode(CENTER);
  newShape();
}

void draw() {
  if(screen == 0){
  background(200);
  //Shape s = shapes.get(index);
  for (int i = 0; i < numShapes; i++) {
    Shape s = shapes.get(i);
    s.show(i);
  }
  match.show(900, 300);
  
  if(score == maxScore){
    time = millis() / 1000.0;
    screen = 1;
  }
  } else {
    background(0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text(time, width/2, height/2);
  }
}

void mousePressed() {
  for (int i = 0; i < numShapes; i++) {
    Shape s = shapes.get(i);
    int x = i % 9;
    int y= i / 9;
    if(s.c == match.c && s.shape == match.shape && pointSquare(mouseX, mouseY, (x*60)+50, (y*60)+50, s.size)){
      newShape();
      Collections.shuffle(shapes);
      score++;
      break;
    }
  }
}

void keyPressed() {
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      //robot.mouseMove(x, y);
      //robot.mousePress(1);
    }
  }
}

void tri(float x, float y, float d) {
  // Calculate side length from height
  float side = 2 * d / sqrt(3);

  // Calculate the three vertices of the triangle
  float x1 = x;                 // Top vertex
  float y1 = y - d / 2;         // Centered vertically at the top
  float x2 = x - side / 2;      // Bottom-left vertex
  float y2 = y + d / 2;
  float x3 = x + side / 2;      // Bottom-right vertex
  float y3 = y + d / 2;

  // Draw the triangle
  triangle(x1, y1, x2, y2, x3, y3);
}


void newShape() {
  int col = (int)random(4);
  int shapetype = (int) random(3);
  color matchcolor;
  if (col == 0) {
    matchcolor = color(255, 0, 0);
  } else if (col == 1) {
    matchcolor = color(0, 255, 0);
  } else if (col == 2) {
    matchcolor = color(0, 0, 255);
  } else {
    matchcolor = color(255, 255, 0);
  }
  match = new Shape(matchcolor, shapetype);
  match.size = 300;
}

boolean pointSquare(float px, float py, float x, float y, float size) {
  float halfSize = size / 2;
  return px >= x - halfSize && px <= x + halfSize &&
    py >= y - halfSize && py <= y + halfSize;
}
