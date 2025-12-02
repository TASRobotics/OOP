static int entityCount = 0;

public abstract class Entity<T extends Body> {
    public int id;
    protected T body;
    protected PVector prevPos;
    protected PVector vel, acc;
    protected boolean isFacingRight = true;

    protected boolean isDead = false;
    protected boolean isUpsideDown;
    protected boolean isFlipping;

    Entity(T body) {
        this.id = entityCount;
        this.body = body;

        this.prevPos = body.getPos().copy();
        this.vel = new PVector();
        this.acc = new PVector();

        this.isUpsideDown = false;

        entityCount++;
    }

    Entity(T body, boolean isUpsideDown) {
        this.id = entityCount;
        this.body = body;

        this.isUpsideDown = isUpsideDown;

        entityCount++;
    }

    public T getBody() {
        return this.body;
    }
    public PVector getPrevPos() {
        return this.prevPos;
    }
    public PVector getPos() {
        return this.body.getPos();
    }
    public PVector getCenter() {
        return this.body.getCenter();
    }
    public PVector getTop() {
        return this.body.getTop();
    }
    public PVector getBottom() {
        return this.body.getBottom();
    }
    public PVector getVel() {
        return this.vel;
    }
    public PVector getAcc() {
        return this.acc;
    }
    public float getMass() {
        return this.body.getMass();
    }
    public boolean getIsFacingRight() {
        return this.isFacingRight;
    }
    public int getDirection() {
        return this.isUpsideDown ? -1 : 1;
    }
    public boolean isUpsideDown() {
        return this.isUpsideDown;
    }
    public boolean isFlipping() {
        return this.isFlipping;
    }
    public boolean isDead() {
        return this.isDead;
    }


    public void setPos(PVector pos) {
        this.body.setPos(pos);
    }
    public void setVel(PVector vel) {
        this.vel = vel;
    }
    public void setAcc(PVector acc) {
        this.acc = acc;
    }
    public void stop() {
        this.vel.mult(0);
        this.acc.mult(0);
    }
    public void setIsUpsideDown(boolean b) {
        if (this.isUpsideDown != b) this.flip();
    }
    public void setIsFlipping(boolean b) {
        this.isFlipping = b;
    }
    public void setIsFacingRight(boolean b) {
        this.isFacingRight = b;
    }
    public void flip() {
        if (this.isFlipping && !ALLOW_FLYING) return;
        
        this.isUpsideDown = !this.isUpsideDown;
        this.isFlipping = true;
    }
    public void die() {
        this.isDead = true;
    }

    public void applyForce(PVector F) {
        if (body.mass == 0) return;
        acc.add(PVector.div(F, body.mass));
    }

    public void update(World world) {
        PVector grav = PVector.mult(GRAVITY, getDirection());

        applyForce(grav);
        prevPos = body.getPos().copy();

        vel.add(PVector.mult(this.acc, dt()));
        body.getPos().add(PVector.mult(this.vel, dt()));
        acc.mult(0);

        // Check for collisions
        Terrain terr = isUpsideDown ? world.upsideDownTerr : world.rightsideUpTerr;
        body.resolveAllCollisions(this, terr, world.platforms, isUpsideDown);

        if (prevPos.x != body.getPos().x) {
            isFacingRight = prevPos.x < body.getPos().x;
        }
    }
    public abstract void display();
}