float [] nums = new float [100];

void setup() {
  size(800, 600);
  float sum = 0;
  for (int i = 0; i< nums.length; i++) {
    nums[i] = random(-100, -1);
    sum = sum + nums[i];
  }
  println("Max:"+max(nums));
  println("Min:"+min(nums));
  println("Avg:"+sum/nums.length);
  printArray(nums);
}
