public class Meeple extends Entity<RectBody> implements HasHealth {
  private float health;
  private float maxHealth;

  private int movementSpeed; // px

  private float jumpVel = 500;
  private boolean didDoubleJump;
  private int layer;
  private boolean isHatOn;

  private Item currentlyHeld;
   
  Meeple(int layer) {
    super(new RectBody(new PVector(500, 50), 40, 80, 1));
    this.maxHealth = 100;
    this.health = this.maxHealth;
    
    this.didDoubleJump = false;

    this.movementSpeed = 200;

    this.layer = layer;
    this.isHatOn = true;
    this.currentlyHeld = null;
  }

  public int getLayer() {
    return this.layer;
  }
  public float getW() {
    return this.getBody().getW();
  }
  public float getH() {
    return this.getBody().getH();
  }
  public Item getCurrentlyHeldItem() {
    return this.currentlyHeld;
  }
  public float getHealth() {
      return this.health;
  }
  public float getSacrificialHealth() {
      return 0;
  }
  public void damage(float h) {
      this.health -= min(this.health, h);
      if (this.health == 0) this.isDead = true;
  }
  public void heal(float h) {
      this.health += min(this.maxHealth-this.health, h);
  }
  public float getMaxHealth() {
      return this.maxHealth;
  }

  public void setCurrentlyHeldItem(Item item) {
    this.currentlyHeld = item;
  }
  public void setHealth(float h) {
    this.health = h;
  }

  // ACTIONS
  public void move(boolean isRight) {
    if (isRight) this.getPos().x += movementSpeed*dt();
    else this.getPos().x -= movementSpeed*dt();

    this.setIsFacingRight(isRight);
  }
  public void jump(Terrain terr, ArrayList<Platform> platforms) {
    if (isGrounded(terr, platforms, isUpsideDown) || !this.didDoubleJump) {
      float directionalJumpVel = -this.jumpVel * this.getDirection();
      this.setVel(new PVector(0, directionalJumpVel));

      if (!isGrounded(terr, platforms, isUpsideDown)) this.didDoubleJump = true;
    }
  }

  public void attack(World world) {
    if (currentlyHeld instanceof Weapon) {
      Weapon weapon = (Weapon) currentlyHeld;
      ArrayList<Entity> targets = new ArrayList<Entity>();
      targets.addAll(world.enemies);

      weapon.useAction(this, targets);
    }
  }
  

  public boolean isGrounded(Terrain terr, boolean isUpsideDown) {
    return this.body.isGrounded(terr, isUpsideDown);
  }
  public boolean isGrounded(Terrain terr, ArrayList<Platform> platforms, boolean isUpsideDown) {
    return this.body.isGrounded(terr, platforms, isUpsideDown);
  }

  @Override
  void update(World world) {
    super.update(world);
    logGeneralStats("Meeple Y Vel", vel.y);

    ArrayList<ItemEntity> itemEntities = world.itemEntities;
    for (ItemEntity e : itemEntities) {
      if (Collision.check(this.body, e.getBody()).collided) {
        if (world.itemCapacityLeft() > 0) {
          Item i = e.collect();
          world.addItem(i);
        }
      }
    }

    if (isGrounded(world.getTerrainToUse(isUpsideDown), world.platforms, isUpsideDown)) didDoubleJump = false;
  }

  @Override
  // ChatGPTed below display code
  void display() {
    pushMatrix();

    // origin → bottom‐center of character box
    translate(getPos().x + getBody().getW()/2,
              getPos().y + getBody().getH());

    // --- sizes ---
    float bodyW = this.getBody().getW();
    float bodyH = this.getBody().getH();   // total height (torso + head), no hat

    // head is same width as body, and square
    float headSize = bodyW;
    float torsoH   = bodyH - headSize;

    // --- TORSO ---
    noStroke();
    fill(40, 110, 200);
    rect(-bodyW/2, -torsoH, bodyW, torsoH);

    // --- HEAD ---
    fill(255, 220, 185);
    float headY = -torsoH - headSize;
    rect(-bodyW/2, headY, bodyW, headSize);

    noFill();
    stroke(0);
    strokeWeight(1);
    rect(-bodyW/2, headY, bodyW, bodyH);

    // --- TOP HAT (much smaller) ---
    float hatTopY = headY; // top of head
    float hatW = bodyW * 0.7;
    float hatH = bodyW * 0.5;

    // brim (narrow + short)
    fill(30);
    rect(-hatW/2 - 2, hatTopY - 4, hatW + 4, 4);

    // cylinder (small block)
    fill(20);
    rect(-hatW/2, hatTopY - hatH - 4, hatW, hatH);

    // band (thin stripe)
    fill(100);
    rect(-hatW/2, hatTopY - hatH - 8, hatW, 4);

    popMatrix();

    if (currentlyHeld != null) currentlyHeld.handheldDisplay(this);
  }
}
