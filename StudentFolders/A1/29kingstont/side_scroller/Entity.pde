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

    public PVector getVel() {
        return vel;
    }
    public PVector getAcc() {
        return acc;
    }
    public float getMass() {
        return mass;
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