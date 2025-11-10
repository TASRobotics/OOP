public class Blood extends Particle {
    Blood(PVector p, PVector vel, PVector acc) {
        super(p, vel, acc);
    }

    void display() {
        stroke(0, this.lifespan);
        fill(255, this.lifespan);
        circle(pos.x, pos.y, 24);
    }
}