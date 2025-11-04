class Meeple extends Movable {
  private float w, h;
  private float jmpStren;
  private int layer;
   
  Meeple(int layer) {
    super(new PVector(500, 50), 1);
    w = 40;
    h = 80;
    jmpStren = 10;

    this.layer = layer;
  }

  public int getLayer() {
    return layer;
  }
  
  public void update(World world) {
    super.update();
    
    float terrH = world.terr.getHeightAt(pos.x+w/2);
    if (pos.y+h >= terrH) {
        vel.y = 0;
        pos.y = world.terr.getHeightAt(pos.x+w/2)-h;
    }
  }
  
  public void moveX(float dx) {
    pos.x += dx;
  }
  
  public void jump() {
    float terrH = world.terr.getHeightAt(pos.x+w/2);
    if (pos.y+h >= terrH) this.applyForce(new PVector(0, -jmpStren));
  }
  
  @Override
  public void display() {
    fill(255);
    rect(pos.x, pos.y, w, h);
    text(pos.x, pos.x, pos.y-20);
  }
}
