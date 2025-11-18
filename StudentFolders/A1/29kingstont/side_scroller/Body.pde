public abstract class Body extends Displayable {
    protected PVector vel, acc;
    protected float mass;

    protected boolean isStatic;

    Body(PVector pos, float mass, boolean isStatic) {
        super(pos);

        this.vel = new PVector();
        this.acc = new PVector();
        this.mass = mass;
        this.isStatic = isStatic;
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
    public void setVel(PVector vel) {
        if (isStatic) throw new Error("Cannot set velocity on static body");
        this.vel = vel;
    }
    public void setAcc(PVector acc) {
        if (isStatic) throw new Error("Cannot set acceleration on static body");
        this.acc = acc;
    }

    public void applyForce(PVector F) {
        if (isStatic) throw new Error("Cannot apply force on static body");
        this.acc.x += F.x / this.mass;
        this.acc.y += F.y / this.mass;
    }

    public void update() {
        if (isStatic) return;

        this.vel.add(PVector.mult(this.acc, dt()));
        this.pos.add(PVector.mult(this.vel, dt()));
        this.acc.mult(0);
    }

    public abstract void collideFloor(Terrain terr, ArrayList<Platform> platforms);
    public abstract boolean isGrounded(Terrain terr);
    public abstract boolean isGrounded(Terrain terr, ArrayList<Platform> platforms);

    public abstract void display();
    public abstract void display(color c);
}