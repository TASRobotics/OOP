public class Environment {
  private final color c = color(0, 63, 101);
  private float ticks;
  private float dayLen;
  
  private boolean isRaining;

  private final float MIN_DARKNESS = 20;

  private PGraphics glowTemplate;
  private PGraphics lightMask;
  private PGraphics darknessFilter;

  Environment() {
    ticks = 0;
    dayLen = pow(2, 12);
    
    isRaining = true;

    lightMask = createGraphics(width, height);
    darknessFilter = createGraphics(width, height);
  }

  public void update() {
    lightMask.beginDraw();
    float alpha = map(getDayPercentage(), 0, 1, 255-MIN_DARKNESS, 0); // inverse the alpha because it's applied to a darkness layer
    lightMask.background(alpha);
    lightMask.endDraw();

    ticks += 1;
  }

  public float getTimeToday() {
    return ticks % dayLen;
  }

  // [0, 1)
  public float getDayPercentage() {
    if (CONSTANT_DAYTIME) return 1;
    
    float todayTime = ticks % dayLen;
    // q1 - Night
    // q2 - Progress to day
    // q3 - Day
    // q4 - Progress to night

    float nightEnd =      dayLen * 1/4.0;
    float nightToDayEnd = dayLen * 2/4.0;
    float dayEnd =        dayLen * 3/4.0;
    float dayToNightEnd = dayLen * 4/4.0;

    if (todayTime < nightEnd) return 0;
    else if (todayTime < nightToDayEnd) return map(todayTime, nightEnd, nightToDayEnd, 0, 1);
    else if (todayTime < dayEnd) return 1;

    return map(todayTime, dayEnd, dayToNightEnd, 1, 0);
  }

  void glow(RectBody b, int r, PVector offset) {
    PVector c = PVector.sub(b.getCenter(), offset);
    float fadeStartR = 0;

    float alpha = map(getDayPercentage(), 0, 1, 255-MIN_DARKNESS, 0);

    lightMask.beginDraw();
    lightMask.noStroke();

    int increment = 5;
    if (MINIMIZE_GRAPHICS) increment = 7;

    for (int i=r; i>=0; i-=increment) {
      if (r <= fadeStartR) {
          lightMask.fill(0);
        } else {
          lightMask.fill(map(i, fadeStartR, r, 0, alpha));
        }
        lightMask.circle(c.x, c.y, i*2);
    }

    // lightMask.loadPixels();

    // for (int i = 0; i < lightMask.pixels.length; i++) {
    //   int x = i%lightMask.width;
    //   int y = i/lightMask.width;
      
    //   float pixelDist = dist(x, y, c.x, c.y);
    //   if (pixelDist <= r) {
    //     if (pixelDist <= fadeStartR) {
    //       lightMask.pixels[i] = color(0);
    //     } else {
    //       float exp = 1;
    //       lightMask.pixels[i] = color(map(pow(pixelDist, exp), pow(fadeStartR, exp), pow(r, exp), 0, alpha));
    //     }
    //   }
    // }
    // lightMask.updatePixels();

    lightMask.endDraw();
  }

  public void displayBackground(PVector offset) {    
    float daypercentage = getDayPercentage();
    fill(0, map(daypercentage, 0, 1, 12.6, 63), map(daypercentage, 0, 1, 20.2, 101));
    noStroke();
    rect(offset.x, offset.y, width, height);
  }

  public void displayFilter(PVector offset) {    
    darknessFilter.beginDraw();
    darknessFilter.background(0);
    darknessFilter.endDraw();

    darknessFilter.mask(lightMask);

    image(darknessFilter, offset.x, offset.y);
  }
}
