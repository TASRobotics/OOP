public class Vestido extends Enemy<RectBody> {
    private float minDamage;
    private float maxDamage;

    private float range;
    private Integer bombTriggeredTime;
    private int detonationDelay;

    // private ShootingThing gun;

    Vestido(PVector pos, boolean isUpsideDown) {
        super(new RectBody(pos, 40, 80, 1), 0.5, 80, 0, 100, 5, isUpsideDown);
        this.range = 150;
        this.detonationDelay = 2000;

        this.minDamage = 20;
        this.maxDamage = damage;

        // this.gun = new ShootingThing(100, 1, 9999, 0);
    }

    // Vestido(PVector pos, int movementSpeed, float minDamage, float maxDamage, float range, int detonationDelay, int cooldown, int maxHealth, boolean isUpsideDown) {
    //     super(new RectBody(pos, 40, 80, 1), movementSpeed, maxDamage, cooldown, maxHealth, isUpsideDown);
    //     this.range = range;
    //     this.detonationDelay = detonationDelay;

    //     this.minDamage = minDamage;
    //     this.maxDamage = maxDamage;

    //     // this.gun = new ShootingThing(0, 1, 9999, 0);
    // }

    @Override
    protected void move(Meeple meeple) {
        float diff = meeple.getPos().x - this.getPos().x;

        if (diff > 0) {
            this.getPos().x += movementSpeed;
            this.setIsFacingRight(true);
        } else if (diff < 0) {
            this.getPos().x -= movementSpeed;
            this.setIsFacingRight(false);
        }
    }

    @Override
    protected boolean attackConditionSatisfied(Meeple meeple) {
        return meeple.getPos().dist(this.getCenter()) <= range;
    }

    @Override
    protected void attack(World world) {
        Meeple meeple = world.getMeeple();
        if (meeple == null) return;

        if (bombTriggeredTime == null) {
            bombTriggeredTime = millis();
            setMovementSpeed(2);
        }
    }

    @Override
    public void update(World world) {
        super.update(world);

        // Meeple meeple = world.getMeeple();
        // if (meeple == null) return;
        // gun.useAction(this, meeple);

        if (bombTriggeredTime != null && millis() - bombTriggeredTime >= detonationDelay) {
            Meeple meeple = world.getMeeple();
            if (meeple == null) return;

            explode(meeple);
        }
    }

    private void explode(Meeple meeple) {
        // Calculate damage
        if (attackConditionSatisfied(meeple)) {
            float dist = meeple.getCenter().dist(this.getCenter());
            float damageToDeal = map(dist, 0, range, maxDamage, minDamage);

            meeple.damage(damageToDeal);
        }

        die();
    }

    @Override
    public void display() {
        stroke(0);
        strokeWeight(1);

        if (bombTriggeredTime != null) {
            PVector center = getCenter();
            fill(map(millis()-bombTriggeredTime, 0, detonationDelay, 100, 255), 0, 0, 255/2);
            circle(center.x, center.y, range*2);
        }
        
        PVector pos = getPos();
        RectBody body = getBody();
        fill(0, 255, 0);
        rect(pos.x, pos.y, body.getW(), body.getH());

        // gun.handheldDisplay(this);

        displayHp(this);
    }
}