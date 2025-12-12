class NamePicker {
  String[] names;
  int lastSelected = -1; 
  int currentIndex = -1;
  int ts = 40;

  boolean chaChing = false; //is epilepsy machine running
  int numFast = 30; //how many fast names to show before slowing down
  float frameWait = 2; //how many frames to wait before showing a new name
  int maxWait = 60; //longest wait before stopping
  int fastTimes = 0; //count for how many fast frames
  int lastFrame = 0; //last time name was updated

  void coolAnimation() {
    if (fastTimes < numFast && frameCount - lastFrame > (int)frameWait) {
      currentIndex = (int)random(0, names.length);
      lastFrame = frameCount;
      fastTimes++;
    }
    if (fastTimes == numFast) {
      if (frameCount - lastFrame > (int)frameWait) {
        frameWait = (frameWait * 1.25);
        lastFrame = frameCount;
        currentIndex = (int)random(0, names.length);
        if (frameWait > maxWait) {
          fastTimes = 0;
          chaChing = false;
        }
      }
    }

    text(names[currentIndex], width/2, height/2);
  }

  NamePicker(String s) {
    names = loadStrings(s);
  }

  void printNames() {
    printArray(names);
  }

  void displayName() {
    textAlign(CENTER, CENTER);
    textSize(ts);
    if (chaChing == false) {
      if (currentIndex != -1) {
        text(names[currentIndex], width/2, height/2);
      }
    } else {
      coolAnimation();
    }
  }

  String pickRandomName() {
    int index = (int)random(0, names.length);
    String selected = names[index];

    return selected;
  }
}
