/*
 * Array of Images - Interactive Image Display
 * 
 * This sketch demonstrates:
 * - Loading multiple images into an array
 * - Mouse-following image display
 * - Click interaction to cycle through images
 * - Array bounds checking and cycling
 * 
 * Key concepts:
 * - PImage array for storing multiple images
 * - Image loading from data folder
 * - Mouse interaction for image switching
 * - Array indexing and bounds management
 */

PImage[] pics = new PImage[5]; // Array to store 5 images
int num = 0; // Current image index to display

void setup() {
  //fullScreen(); // Uncomment for fullscreen mode
  size(800, 600); // Set canvas size to 800x600 pixels
  
  // Load all 5 images from the data folder (0.png, 1.png, 2.png, 3.png, 4.png)
  for(int i = 0; i < 5; i++){
    pics[i] = loadImage(i + ".png"); // Load image with filename based on index
  }

}

void draw() {
  image(pics[num], mouseX, mouseY); // Display current image at mouse position
}

void mousePressed() {
  num++; // Move to next image in array
  if(num >= pics.length){ // Check if we've reached the end of the array
    num = 0; // Reset to first image (cycle back to beginning)
  }
}
