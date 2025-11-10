public abstract class Static extends Displayable {
  protected PGraphics cachedRender;
  public int w, h;
  
  Static(PVector pos, int w, int h) {
    super(pos);
    this.w = w;
    this.h = h;
    
    this.cachedRender = createGraphics(w, h);
    this.renderCache();
  }
  
  // protected float getBrightness(float dayPercentage) {
  //   if (this.layer <= 2) return map(1-dayPercentage, 0, 1, 0.8, 0.15);
  //   return map(1-dayPercentage, 0, 1, 0.33, 0.078);
  // }
 
  protected abstract void renderCache();

  // public abstract void update();

  @Override
  public void display() {
    // float brightness = this.getBrightness(dayPercentage);
    //tint(0, (1-brightness)*255);
    // canvas
    image(cachedRender, pos.x-w/2, pos.y-h); // Draw from top left
  }
}
