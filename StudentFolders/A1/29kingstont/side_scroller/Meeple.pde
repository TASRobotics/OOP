public class Meeple extends Entity<RectBody> {
  private float jumpVel;
  private int layer;
   
  Meeple(int layer) {
    super(new RectBody(new PVector(500, 50), 1, 40, 80, false));
    this.jumpVel = 350; // px

    this.layer = layer;
  }

  public int getLayer() {
    return this.layer;
  }
  public void move(PVector m) {
    this.getPos().add(PVector.mult(m, dt()));
  }
  
  public void update(World world) {
    super.update(world);
    
    this.body.collideFloor(world.terr, world.platforms);
  }
  
  public void jump(Terrain terr, ArrayList<Platform> platforms) {
    if (isGrounded(terr, platforms)) {
      this.getVel().add(new PVector(0, -this.jumpVel));
    }
  }

  public boolean isGrounded(Terrain terr, ArrayList<Platform> platforms) {
    return this.body.isGrounded(terr, platforms);
  }
}
