public abstract class Body {
    protected PVector pos, prevPos;
    protected boolean isFacingRight;

    protected PVector vel, acc;
    protected float mass;

    protected boolean isStatic;

    Body(PVector pos, float mass, boolean isStatic) {
        this.pos = pos;
        this.prevPos = pos.copy();
        this.isFacingRight = true;

        this.vel = new PVector();
        this.acc = new PVector();
        this.mass = mass;
        this.isStatic = isStatic;
    }

    public PVector getPos() {
        return this.pos;
    }
    public float getX() {
        return this.pos.x;
    }
    public float getY() {
        return this.pos.y;
    }
    public PVector getVel() {
        return this.vel;
    }
    public PVector getAcc() {
        return this.acc;
    }
    public float getMass() {
        return this.mass;
    }
    public PVector getPrevPos() {
        return this.prevPos;
    }

    // Returns whether or not it's right
    public boolean getIsFacingRight() {
        return this.isFacingRight;
    }
    


    public void setPos(PVector pos) {
        if (isStatic) throw new Error("Cannot set position on static body");
        this.pos = pos;
    }
    public void setVel(PVector vel) {
        if (isStatic) throw new Error("Cannot set velocity on static body");
        this.vel = vel;
    }
    public void setAcc(PVector acc) {
        if (isStatic) throw new Error("Cannot set acceleration on static body");
        this.acc = acc;
    }
    public void setIsFacingRight(boolean b) {
        this.isFacingRight = b;
    }

    public void applyForce(PVector F) {
        if (isStatic) throw new Error("Cannot apply force on static body");
        this.acc.x += F.x / this.mass;
        this.acc.y += F.y / this.mass;
    }

    public void update(World world) {
        if (isStatic) return;

        this.prevPos = this.pos.copy();

        this.vel.add(PVector.mult(this.acc, dt()));
        this.pos.add(PVector.mult(this.vel, dt()));
        this.acc.mult(0);

        this.collide(world.terr, world.platforms);

        if (this.prevPos.x != this.pos.x) {
            isFacingRight = this.prevPos.x < this.pos.x;
        }
    }

    public abstract void collide(Terrain terr, ArrayList<Platform> platforms);
    public abstract boolean isGrounded(Terrain terr);
    public abstract boolean isGrounded(Terrain terr, ArrayList<Platform> platforms);
}