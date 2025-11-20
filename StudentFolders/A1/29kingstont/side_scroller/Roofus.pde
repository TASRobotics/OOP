public class Roofus extends Enemy<RectBody> {
    Roofus(PVector pos) {
        super(new RectBody(pos, 1, 40, 80, false), 1000);
    }

    @Override protected void move(Meeple meeple) {
        float diff = meeple.getPos().x - this.getPos().x;
        if (diff > 0) {
            this.getPos().x += movementSpeed;
        } else if (diff < 0) {
            this.getPos().x -= movementSpeed;
        }
    }

    @Override
    protected boolean attackConditionSatisfied(Meeple meeple) {
        return Collision.check(this.getBody(), meeple.getBody()).collided;
    }

    @Override
    protected void attack(Meeple meeple) {
        meeple.damage(20);
    }

    @Override
    public void display() {
        stroke(0);
        strokeWeight(1);
        fill(255, 0, 0);
        rect(this.getPos().x, this.getPos().y, this.getBody().getW(), this.getBody().getH());

        displayHp();
    }
}