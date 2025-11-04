public abstract class Movable extends Displayable {
    protected PVector vel, acc;
    protected float mass;

    Movable(PVector pos, float mass) {
        super(pos);
        this.vel = new PVector();
        this.acc = new PVector();
        this.mass = mass;
    }

    Movable(PVector pos, PVector vel, PVector acc, float mass) {
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

    public void update() {
        vel.add(acc);
        pos.add(vel);
        acc.mult(0);
    }

    @Override
    public abstract void display();
}