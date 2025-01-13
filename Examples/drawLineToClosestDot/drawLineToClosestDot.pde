// Importing ArrayList to store coordinates
ArrayList<PVector> coords = new ArrayList<PVector>(); // List to hold the positions of the dots
int numDots = 25; // Number of dots to display on the screen

void setup(){
  fullScreen(); // Sets up a fullscreen window
  
  // Initialize the positions of the dots
  for(int i = 0; i < numDots; i++){
    // Generate random positions for each dot within the screen dimensions
    coords.add(new PVector(random(width), random(height)));
  }
  
  stroke(255); // Set the stroke color (outline) to white
}

void draw(){
  background(50); // Clear the screen with a dark gray background

  int closestIndex = 0; // Index of the closest dot to the mouse
  // Calculate the distance from the first dot to the mouse pointer
  float distance = dist(coords.get(0).x, coords.get(0).y, mouseX, mouseY);
  
  // Loop through all the dots
  for(int i = 0; i < numDots; i++){
    PVector temp = coords.get(i); // Get the position of the current dot
    circle(temp.x, temp.y, 20); // Draw the dot as a circle with a diameter of 20
    
    // Calculate the distance from the current dot to the mouse pointer
    float newDistance = dist(coords.get(i).x, coords.get(i).y, mouseX, mouseY);
    if(newDistance < distance){ // If the current dot is closer than the previous closest dot
      distance = newDistance; // Update the closest distance
      closestIndex = i; // Update the index of the closest dot
    } 
  }
  
  // Get the position of the closest dot
  PVector closest = coords.get(closestIndex);
  // Draw a line connecting the mouse pointer to the closest dot
  line(mouseX, mouseY, closest.x, closest.y);
}

void mousePressed(){
  // This function is currently empty, but it can be used to add interaction
}
