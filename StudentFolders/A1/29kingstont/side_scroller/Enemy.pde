public abstract class Enemy<T extends Body> extends Entity<T> {
    private int cooldown; // ms
    protected float damage;
    private Integer lastAttacked;

    Enemy(T body, int movementSpeed, float damage, int cooldown, int maxHealth) {
        super(body, maxHealth, movementSpeed);
        this.damage = damage;
        this.cooldown = cooldown;
    }

    protected abstract void move(Meeple meeple);

    protected boolean cooldownSatisfied() {
        if (lastAttacked == null) return true;
        return millis() - lastAttacked >= cooldown;
    }
    protected void resetCooldown() {
        this.lastAttacked = null;
    }

    protected abstract boolean attackConditionSatisfied(Meeple meeple);
    protected abstract void attack(World world);
    
    @Override
    public void update(World world) {
        super.update(world);

        Meeple meeple = world.getMeeple();

        if (meeple != null) {
            this.move(meeple);

            if (this.attackConditionSatisfied(meeple)) {
                if (this.cooldownSatisfied()) {
                    this.attack(world);
                    lastAttacked = millis();
                }
            } else {
                resetCooldown();
            }
        }
    }
    public abstract void display();
}