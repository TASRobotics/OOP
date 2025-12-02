public class Minion extends Enemy<RectBody> {
    Minion(PVector pos) {
        super(new RectBody(pos, 40, 40, 1), 3, 1, 500, 5);
    }

    @Override
    protected void move(Meeple meeple) {
        float diff = meeple.getPos().x - this.getPos().x;
        if (abs(diff) < 20) return;

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
    protected void attack(World world) {
        Meeple meeple = world.getMeeple();
        if (meeple == null) return;

        meeple.damage(damage);
    }

    @Override
    public void display() {
        stroke(0);
        strokeWeight(1);
        fill(255, 0, 0);
        
        PVector pos = this.getPos();
        RectBody body = this.getBody();
        rect(pos.x, pos.y, body.getW(), body.getH());

        displayHp(this);
    }
}