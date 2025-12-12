//first two numbers are the small circle
//if you click on smaller circle, you get 1 point
//if you click on other circles, you lose a point
int numCircles = 5;
float[] nums = new float[numCircles*2];

int score = 0;

void setup() {
  //fullScreen();
  size(700, 700);
  randomize();
}

void draw() {
  background(0);
  for (int i = 0; i < nums.length; i = i + 2) {
    if (i == 0) {
      circle(nums[i], nums[i+1], 80);
    } else {
      circle(nums[i], nums[i+1], 100);
    }
  }
}

void mousePressed() {
  for (int i = 0; i < nums.length; i = i + 2) {
    if (pointCircle(mouseX, mouseY, nums[i], nums[i+1], 40)) {
      if (i == 0) {
        score++;
        randomize();
      } else{
        score--;
        randomize();
      }
    }
  }
  println(score);
}

void randomize() {
  for (int i = 0; i < nums.length; i++) {
    nums[i] = random(100, width-100);
  }
}
