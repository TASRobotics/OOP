/*
 * Array Color Circles - Interactive Colorful Circle Animation
 * 
 * This sketch demonstrates:
 * - Array management for multiple objects
 * - Random color generation with specific color ranges
 * - Interactive size changes based on mouse input
 * - Efficient rendering of multiple circles
 * 
 * Key concepts:
 * - Parallel arrays for storing object properties
 * - Random color generation with controlled ranges
 * - Mouse interaction affecting all objects
 * - Array iteration for updates and rendering
 */

int num = 400; // Number of circles to create

color[] rainbow = new color[num]; // Array to store colors for each circle
float[] xs = new float[num]; // Array to store x-coordinates of circles
float[] ys = new float[num]; // Array to store y-coordinates of circles
float[] sizes = new float[num]; // Array to store sizes of circles
void setup() {
  //fullScreen(); // Uncomment for fullscreen mode
  size(800, 600); // Set canvas size to 800x600 pixels
  noStroke(); // Remove stroke from all shapes
  
  // Initialize all circles with random properties
  for (int i = 0; i < rainbow.length; i++) {
    color temp = color(random(10, 120), random(10, 120), random(200, 255)); // Generate random color with blue bias
    rainbow[i] = temp; // Store color in rainbow array
    xs[i] = random(width); // Random x-position within screen width
    ys[i] = random(height); // Random y-position within screen height
    sizes[i] = random(20, 100); // Random size between 20 and 100 pixels
  }
}

void draw() {
  // When mouse is pressed, randomly change sizes of all circles
  if (mousePressed) {
    for (int i = 0; i < rainbow.length; i++) { // Go through all the array indexes
      sizes[i] += random(-5, 5.00001); // Add random size change between -5 and +5
    }
  }

  background(180); // Light gray background
  
  // Draw all circles with their current properties
  for (int i = 0; i < rainbow.length; i++) {
    fill(rainbow[i]); // Set fill color for this circle
    circle(xs[i], ys[i], sizes[i]); // Draw circle at position with current size
  }
}
