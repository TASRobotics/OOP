public class FlyingDog extends Entity {
    private float maxSpeed;
    private float maxForce;

    FlyingDog(PVector pos) {
        super(pos, 1);
        this.maxSpeed = 10;
        this.maxForce = 0.4;
    }

    @Override
    public void update(World world) {
        super.update(world);
        
        PVector desired = PVector.sub(world.meeple.getCenter(), this.pos);
        float d = desired.mag();

        float padding = 10;
        if (this.pos.y >= world.terr.getHeightAt(this.pos.x) - padding) {
            float distToFloor = Math.max(0, world.terr.getHeightAt(this.pos.x) - this.pos.y);
            desired = new PVector(this.vel.x, -map(distToFloor, 0, padding, maxSpeed, maxSpeed/2));
        }

        
        desired.normalize();

        if (d < 300) {
            desired.mult(map(d, 0, 100, 0, maxSpeed));
        } else desired.mult(maxSpeed);
    
        PVector steer = PVector.sub(desired, this.vel);
        steer.limit(maxForce);
        applyForce(steer);
    }

    public void display() {
        fill(0,255,0);
        circle(pos.x, pos.y, 50);
    }
}