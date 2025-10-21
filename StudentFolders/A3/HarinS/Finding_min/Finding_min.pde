int[] nums = {10, 20, 30, 10, 7, 13};

void setup(){
  int min= nums[0];
  for(int i = 0; i < nums.length - 1; i++){
    int bigger = Math.min(nums[i], nums[i+1]);
    if(bigger < min){
     min = bigger; 
    }
  }
  println(min);
}
