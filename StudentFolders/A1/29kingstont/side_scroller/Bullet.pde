public class Bullet extends Entity<CircleBody> {
    Bullet(PVector pos, PVector vel, PVector acc, int r) {
        super(new CircleBody(pos, r, false), r, -1);

        this.body.setVel(vel);
        this.body.setAcc(acc);
    }

    @Override
    public void display() {
        fill(255, 0, 0);
        noStroke();
        circle(this.getPos().x, this.getPos().y, this.getBody().getR());
    }
}