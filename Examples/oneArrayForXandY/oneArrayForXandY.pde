int numcircles = 1000;
float[] nums = new float[numcircles * 2];

void setup() {
  //fullScreen();
  size(800, 600);
  for (int i = 0; i < numcircles * 2; i++) {
    nums[i] = random(600);
  }
}

void draw() {
  for (int i = 0; i < numcircles * 2; i+=2) {
    if (i == 0) {
      circle(nums[i], nums[i+1], 80);
    } else {
      circle(nums[i], nums[i+1], 100);
    }
  }
}
