public class Dirt extends Particle {
    Dirt(PVector p, PVector vel, PVector acc) {
        super(p, vel, acc, 15);
    }

    void display() {
        stroke(0, this.lifespan);

        float alpha = map(this.lifespan, 0, this.maxLifespan, 0, 255);
        fill(141, 96, 58, alpha);
        circle(pos.x, pos.y, 8);
    }
}