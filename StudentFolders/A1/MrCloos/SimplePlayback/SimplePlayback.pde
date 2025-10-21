/**
 * This is a simple sound file player. Use the mouse position to control playback
 * speed, amplitude and stereo panning.
 */

import processing.sound.*;

SoundFile file;

void setup() {
  size(640, 360);
  background(255);

  // Load a file
  file = new SoundFile(this, "vibraphon.aiff");

  // These methods return useful infos about the file
  println("SFSampleRate= " + file.sampleRate() + " Hz");
  println("SFSamples= " + file.frames() + " samples");
  println("SFDuration= " + file.duration() + " seconds");

  // Play the file in a loop
  file.loop();
  //file.amp(0.2);
  //file.rate(3);
}      


void draw() {
  //float rate = map(mouseX, 0, width, 0.1, 4);
  //println(rate);
  //file.rate(rate);
  // Map mouseX from 0.25 to 4.0 for playback rate. 1 equals original playback speed,
  // 2 is twice the speed and will sound an octave higher, 0.5 is half the speed and
  // will make the file sound one ocative lower.
  float playbackSpeed = map(mouseX, 0, width, 0.25, 4.0);
  file.rate(playbackSpeed);

  //// Map mouseY from 0.2 to 1.0 for amplitude
  //float amplitude = map(mouseY, 0, width, 0.2, 1.0);
  //file.amp(amplitude);

  //// Map mouseY from -1.0 to 1.0 for left to right panning
  float panning = map(mouseY, 0, height, -1.0, 1.0);
  file.pan(panning);
}
