public class FlyingDog extends Entity<CircleBody> {
    private float maxSpeed;
    private float maxForce;

    FlyingDog(PVector pos) {
        super(new CircleBody(pos, 1, 25, false));
        this.maxSpeed = 400;
        this.maxForce = 1_700;
    }

    @Override
    public void update(World world) {
        super.update(world);

        PVector pos = this.getPos();
        PVector vel = this.getVel();
        
        PVector desired = PVector.sub(world.meeple.getCenter(), pos);
        float d = desired.mag();

        float padding = 10;
        if (pos.y >= world.terr.getHeightAt(pos.x) - padding) {
            float distToFloor = Math.max(0, world.terr.getHeightAt(pos.x) - pos.y);
            desired = new PVector(vel.x, -map(distToFloor, 0, padding, maxSpeed, maxSpeed/2));
        }

        
        desired.normalize();

        if (d < 300) {
            desired.mult(map(d, 0, 100, 0, maxSpeed));
        } else desired.mult(maxSpeed);
    
        PVector steer = PVector.sub(desired, vel);
        steer.limit(maxForce);
        applyForce(steer);

        this.body.collide(world.terr, world.platforms);
    }

    @Override
    public void display() {
        stroke(0);
        strokeWeight(1);
        
        fill(255, 0, 0);
        circle(this.getPos().x, this.getPos().y, this.getBody().getR()*2);
    };
}