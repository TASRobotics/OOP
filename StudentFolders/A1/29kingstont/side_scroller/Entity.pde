static int entityCount = 0;

public abstract class Entity<T extends Body> {
    public int id;
    protected T body;
    protected Body attachedBody;

    Entity(T body) {
        this.id = entityCount;
        this.body = body;

        this.attachedBody = null;

        entityCount++;
    }

    public T getBody() {
        return this.body;
    }
    public void attachTo(Body b) {
        this.attachedBody = b;
    }
    public void detach() {
        this.attachedBody = null;
    }

    public PVector getCenter() {
        return this.body.getPos();
    };
    public PVector getPos() {
        return this.body.getPos();
    }
    public PVector getVel() {
        return this.body.getVel();
    }
    public PVector getAcc() {
        return this.body.getAcc();
    }
    public float getMass() {
        return this.body.getMass();
    }
    public void setPos(PVector pos) {
        this.body.setPos(pos);
    }
    public void setVel(PVector vel) {
        this.body.setVel(vel);
    }
    public void stop() {
        this.body.setVel(new PVector(0, 0));
        this.body.setAcc(new PVector(0, 0));
    }
    public void setAcc(PVector acc) {
        this.body.setAcc(acc);
    }
    public void applyForce(PVector F) {
        this.body.applyForce(F);
    }


    public void update(World world) {
        this.body.update();
        if (this.attachedBody != null) {
            this.setPos(this.attachedBody.getPos().copy());
        }
    }
    public void display() {
        this.body.display();
    };
}