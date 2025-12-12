public abstract class Body {
    protected PVector pos;

    // protected PVector vel, acc;
    protected float mass;

    Body(PVector pos, float mass) {
        this.pos = pos;

        // this.vel = new PVector();
        // this.acc = new PVector();
        this.mass = mass;
    }

    public PVector getPos() {
        return this.pos;
    }
    public abstract PVector getBottom();
    public abstract PVector getTop();
    public abstract PVector getCenter();
    public final PVector getAppropriatePos(boolean isUpsideDown) {
        return isUpsideDown ? getBottom() : getTop();
    } 
    public float getMass() {
        return this.mass;
    }
    
    public void setPos(PVector pos) {
        this.pos = pos;
    }
    public abstract void setBottom(PVector p);
    public abstract void setTop(PVector p);
    public abstract void setCenter(PVector p);

    public abstract void resolveAllCollisions(Entity entity, Terrain terr, ArrayList<Platform> platforms, boolean isUpsideDown);
    public abstract boolean isGrounded(Terrain terr, boolean isUpsideDown);
    public abstract boolean isGrounded(Terrain terr, ArrayList<Platform> platforms, boolean isUpsideDown);

    public abstract boolean isWithin(float minX, float maxX);
}