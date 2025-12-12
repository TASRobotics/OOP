public abstract class Particle {
    protected PVector pos;
    protected PVector vel;
    protected PVector acc;
    protected float lifespan;
    protected float maxLifespan;
   
    Particle(PVector p, PVector vel, PVector acc, int lifespan) {
        pos = p;
        this.acc = acc;
        this.vel = vel;

        this.lifespan = lifespan;
        this.maxLifespan = lifespan;
    }
   
    void applyForce(PVector f) {
        acc.add(f);
    }
   
    void update() {
        vel.add(acc);
        pos.add(vel);
        lifespan -= 1.0;
        
        acc.mult(0);
    }

    boolean getIsDead() {
        return lifespan < 0.0; 
    }

    abstract void display();
}