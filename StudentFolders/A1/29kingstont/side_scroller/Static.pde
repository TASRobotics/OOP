public abstract class Static extends Displayable {
  // protected PGraphics cachedRender;
  public int w, h;
  
  Static(PVector pos, int w, int h) {
    super(pos);
    this.w = w;
    this.h = h;
    
    // this.cachedRender = createGraphics(w, h);
    // this.renderCache();
  }
 
  // protected abstract void renderCache();

  @Override
  public abstract void display();
  // public void display() {
  //   image(cachedRender, pos.x-w/2, pos.y-h); // Draw from top left
  // }
}
