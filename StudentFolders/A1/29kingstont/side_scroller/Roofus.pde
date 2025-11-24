public class Roofus extends Enemy<RectBody> {
    private int numAttacks = 0;
    private final int spawnEvery = 1;

    private Weapon weapon;

    Roofus(PVector pos) {
        super(new RectBody(pos, 40, 80, 1, false), 1, 5, 1000, 50);

        this.weapon = new Knife(0, this.damage, 30, 30); // cooldown 0 because managed by Enemy class
    }

    @Override
    protected void move(Meeple meeple) {
        float diff = meeple.getPos().x - this.getPos().x;
        if (abs(diff) < 20) return;

        if (diff > 0) {
            this.getPos().x += movementSpeed;
            this.body.setIsFacingRight(true);
        } else if (diff < 0) {
            this.getPos().x -= movementSpeed;
            this.body.setIsFacingRight(false);
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
        numAttacks++;

        if (numAttacks % spawnEvery == 0) {
            float enemyX = random(world.getOffset().x, world.getOffset().x+width);
            Enemy enemy = new Minion(new PVector(enemyX, 500));
            world.createEnemy(enemy);
        }
    }

    @Override
    public void display() {
        stroke(0);
        strokeWeight(1);
        fill(5, 224, 195);
        
        PVector pos = this.getPos();
        RectBody body = this.getBody();
        rect(pos.x, pos.y, body.getW(), body.getH());
        
        this.weapon.handheldDisplay(this);

        this.displayHp();
    }
}