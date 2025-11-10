public abstract class Particle {
    PVector pos;
    PVector vel;
    PVector acc;
    float lifespan;
   
    Particle(PVector p, PVector vel, PVector acc) {
        pos = p;
        this.acc = acc;
        this.vel = vel;
        lifespan = 255;
    }
   
    void applyForce(PVector f) {
        acc.add(f);
    }
   
    void update() {
        vel.add(acc);
        pos.add(vel);
        lifespan -= 2.0;
        
        acc.mult(0);
    }

    boolean isDead() {
        return lifespan < 0.0; 
    }

    abstract void display();
}