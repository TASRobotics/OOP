// Create an ArrayList to store PVector objects that represent the positions of the trail
ArrayList<PVector> trail = new ArrayList<PVector>();

// Set the number of trail segments to keep track of
int numTrails = 15;

void setup() {
  // The 'fullScreen' method is commented out, so the window size will be set manually
  // fullScreen(); // Uncomment this if you want the sketch to open in full-screen mode
  size(800, 600); // Set the canvas size to 800x600 pixels
}

void draw() {
  background(50); // Clear the background with a dark gray color (RGB value 50)

  // Add the current mouse position as a new PVector at the start of the 'trail' list
  trail.add(0, new PVector(mouseX, mouseY));

  // Set an initial value for the alpha (transparency) of the trail circles
  int c = 255;

  // Loop through the trail ArrayList and draw circles at each stored position
  // The circles will have decreasing transparency to create the fading effect
  for (PVector p : trail) {
    fill(255, c);  // Set the fill color to white with the current alpha value
    circle(p.x, p.y, 50); // Draw a circle at the position of the PVector
    c -= 10;  // Gradually reduce the alpha value to create fading
  }

  // If the number of elements in the 'trail' list exceeds the specified 'numTrails' value,
  // remove the oldest trail segment from the end of the list
  if (trail.size() >= numTrails) {
    trail.remove(numTrails - 1); // Remove the last element to keep the trail length constant
  }

  // Draw a circle at the current mouse position to represent the most recent position
  fill(255);  // Set the fill color to white (opaque)
  circle(mouseX, mouseY, 50); // Draw a larger circle at the mouse position
}
