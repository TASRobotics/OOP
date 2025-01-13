// Importing ArrayList to store coordinates
ArrayList<PVector> coords = new ArrayList<PVector>(); // List to hold the positions of the dots
int numDots = 25; // Number of dots to display on the screen

PVector pos = new PVector();
float t = 0;

void setup() {
  fullScreen(); // Sets up a fullscreen window

  // Initialize the positions of the dots
  for (int i = 0; i < numDots; i++) {
    // Generate random positions for each dot within the screen dimensions
    coords.add(new PVector(random(width), random(height)));
  }

  stroke(255); // Set the stroke color (outline) to white
  background(50);
}

void draw() {
  float x = map(noise(t+3), 0, 1, 50, width-50);
  float y = map(noise(t), 0, 1, 50, height-50);
  pos = new PVector(x, y);
  t += 0.05;

   // Clear the screen with a dark gray background

  int closestIndex = 0; // Index of the closest dot to the mouse
  // Calculate the distance from the first dot to the mouse pointer
  float distance = dist(coords.get(0).x, coords.get(0).y, pos.x, pos.y);

  // Loop through all the dots
  for (int i = 0; i < numDots; i++) {
    PVector temp = coords.get(i); // Get the position of the current dot
    fill(255);
    circle(temp.x, temp.y, 10); // Draw the dot as a circle with a diameter of 20

    // Calculate the distance from the current dot to the mouse pointer
    float newDistance = dist(coords.get(i).x, coords.get(i).y, pos.x, pos.y);
    if (newDistance < distance) { // If the current dot is closer than the previous closest dot
      distance = newDistance; // Update the closest distance
      closestIndex = i; // Update the index of the closest dot
    }
  }

  // Get the position of the closest dot
  PVector closest = coords.get(closestIndex);
  // Draw a line connecting the mouse pointer to the closest dot
  line( pos.x, pos.y, closest.x, closest.y);
  noFill();
  circle(pos.x, pos.y, 10);
}

void mousePressed() {
  // This function is currently empty, but it can be used to add interaction
}
