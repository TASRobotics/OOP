public class Environment {
  private color c;
  private float ticks;
  private float dayLen;
  
  private boolean isRaining;

  Environment() {
    c = 0; // black
    ticks = 0;
    dayLen = pow(2, 12);
    
    isRaining = true;
  }

  public void advanceTime() {
    ticks += 1;

    float brightness = getDayPercentage();
    c = color(100*brightness, 100*brightness, 180*brightness);
  }

  public color getColor() {
    return c;
  }

  public float getTimeToday() {
    return ticks % dayLen;
  }

  public float getDayPercentage() {
    float todayTime = ticks % dayLen;
    float t1 = dayLen/3.0;
    float t2 = dayLen*2.0/3.0;

    float p;
    if (todayTime <= t1) p = map(todayTime, 0, t1, 0, 1);
    else if (todayTime <= t2) p = 1;
    else p = map(todayTime, t2, dayLen-1, 1, 0);
    
    return p;
  }

  public void display(PVector offset) {
    fill(world.env.getColor());
    rect(offset.x, offset.y, width, height);
  }
}
