public class Meeple extends Entity<RectBody> {
  private float jumpVel;
  private int layer;
  private boolean isHatOn;
   
  Meeple(int layer) {
    super(new RectBody(new PVector(500, 50), 1, 40, 80, false));
    this.jumpVel = 600; // px

    this.layer = layer;
    this.isHatOn = true;
  }

  public int getLayer() {
    return this.layer;
  }
  public void move(PVector m) {
    this.getPos().add(PVector.mult(m, dt()));
  }
  
  public void jump(Terrain terr, ArrayList<Platform> platforms) {
    if (isGrounded(terr, platforms)) {
      this.getVel().add(new PVector(0, -this.jumpVel));
    }
  }

  public boolean isGrounded(Terrain terr) {
    return this.body.isGrounded(terr);
  }
  public boolean isGrounded(Terrain terr, ArrayList<Platform> platforms) {
    return this.body.isGrounded(terr, platforms);
  }

  @Override
  // ChatGPTed below display code
  void display() {
    pushMatrix();

    // origin → bottom‐center of character box
    translate(this.getPos().x + this.getBody().getW()/2,
              this.getPos().y + this.getBody().getH());

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

    displayHp();
  }
}
