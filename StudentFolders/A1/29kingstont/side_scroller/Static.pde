public abstract class Static implements Displayable {
  protected PVector pos;
  public int w, h;
  
  Static(PVector pos, int w, int h) {
    this.pos = pos;
    this.w = w;
    this.h = h;
  }

  public PVector getPos() {
    return this.pos;
  }

  @Override
  public abstract void display();
}
