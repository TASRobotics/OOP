public class Meeple extends Entity {
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

  @Override
  public PVector getCenter() {
    return PVector.add(this.pos, new PVector(w/2, h/2));
  }
  public int getLayer() {
    return layer;
  }
  public void move(PVector m) {
    this.pos.add(m);
  }
  
  public void update(World world) {
    super.update(world);
    
    float terrH = world.terr.getHeightAt(pos.x+w/2);
    if (pos.y+h >= terrH) {
        vel.y = 0;
        pos.y = world.terr.getHeightAt(pos.x+w/2)-h;
    }
  }
  
  public void jump() {
    if (isOnFloor()) this.applyForce(new PVector(0, -jmpStren));
  }

  public boolean isOnFloor() {
    float terrH = world.terr.getHeightAt(pos.x+w/2);
    return pos.y+h >= terrH;
  }
  
  @Override
  public void display() {
    fill(255);
    rect(pos.x, pos.y, w, h);
    text(pos.x, pos.x, pos.y-20);
  }
}
