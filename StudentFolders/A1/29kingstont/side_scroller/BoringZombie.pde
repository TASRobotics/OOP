public class BoringZombie extends Enemy<RectBody> {
    protected Weapon weapon;

    BoringZombie(PVector pos) {
        super(new RectBody(pos, 40, 80, 1), 0.5, 5, 1000, 50);

        this.weapon = new Knife(0, this.damage, 30, 30); // cooldown 0 because managed by Enemy class
    }

    BoringZombie(PVector pos, int movementSpeed, float damage, int cooldown, int maxHealth) {
        super(new RectBody(pos, 40, 80, 1), movementSpeed, damage, cooldown, maxHealth);
   
        this.weapon = new Knife(0, this.damage, 30, 30); // cooldown 0 because managed by Enemy class
    }

    @Override
    protected void move(Meeple meeple) {
        float diff = meeple.getPos().x - this.getPos().x;

        if (diff > 0) {
            if (abs(diff) >= 20) this.getPos().x += movementSpeed;
            this.setIsFacingRight(true);
        } else if (diff < 0) {
            if (abs(diff) >= 20) this.getPos().x -= movementSpeed;
            this.setIsFacingRight(false);
        }
    }

    @Override
    protected boolean attackConditionSatisfied(Meeple meeple) {
        return !this.weapon.getTargetsInRange(this, meeple).isEmpty();
    }

    @Override
    protected void attack(World world) {
        Meeple meeple = world.getMeeple();
        if (meeple == null) return;

        weapon.use(this, meeple);
    }

    @Override
    public void display() {
        stroke(0);
        strokeWeight(1);
        fill(RED);
        
        PVector pos = this.getPos();
        RectBody body = this.getBody();
        rect(pos.x, pos.y, body.getW(), body.getH());
        
        this.weapon.handheldDisplay(this);

        displayHp(this);
    }
}