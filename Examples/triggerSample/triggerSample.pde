import processing.sound.*;

SoundFile file;

// Define a variable to store the randomly generated background color in
int backgroundColor[] = {255, 255, 255};

void setup() {
  size(640, 360);

  file = new SoundFile(this, "boing.wav");
  
}

void draw() {
  background(backgroundColor[0], backgroundColor[1], backgroundColor[2]);
}

void keyPressed() {
  // We use a boolean helper variable to determine whether one of the branches
  // of the switch-statement was activated or not
  boolean validKey = true;

  switch(key) {
  case 'a':
    file.play(3.0, 1.0);
    break;
    // no valid key was pressed, store that information
  default:
    validKey =  false;
  }

  // If a new sample playback was triggered, change the background color
  if (validKey) {
    for (int i = 0; i < 3; i++) {
      backgroundColor[i] = int(random(255));
    }
  }
}
