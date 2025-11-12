static int entityCount = 0;

public abstract class Entity extends Displayable {
    public int id;
    protected PVector vel, acc;
    protected float mass;

    Entity(PVector pos, float mass) {
        super(pos);
        this.id = entityCount;
        this.vel = new PVector();
        this.acc = new PVector();
        this.mass = mass;

        entityCount++;
    }

    Entity(PVector pos, PVector vel, PVector acc, float mass) {
        super(pos);
        this.vel = vel;
        this.acc = acc;
        this.mass = mass;
    }

    public PVector getCenter() {
        return pos.copy();
    };
    public PVector getVel() {
        return vel.copy();
    }
    public PVector getAcc() {
        return acc.copy();
    }
    public float getMass() {
        return mass;
    }
    public void setPos(PVector pos) {
        this.pos = pos;
    }
    public void setVel(PVector vel) {
        this.vel = vel;
    }
    public void stop() {
        this.vel = new PVector(0, 0);
        this.acc = new PVector(0, 0);
    }
    public void setAcc(PVector acc) {
        this.acc = acc;
    }

    public void applyForce(PVector F) {
        acc.add(F.div(mass));
    }

    public void update(World world) {
        vel.add(acc);
        pos.add(vel);
        acc.mult(0);
    }

    @Override
    public abstract void display();
}