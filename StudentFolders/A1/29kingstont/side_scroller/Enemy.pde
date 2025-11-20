public abstract class Enemy<T extends Body> extends Entity<T> {
    int attackSpeed; // ms
    int movementSpeed; // px
    Integer lastAttacked;

    Enemy(T body, int attackSpeed) {
        super(body);
        this.movementSpeed = 1;
        this.attackSpeed = attackSpeed;
    }

    protected abstract void move(Meeple meeple);

    protected boolean cooldownSatisfied() {
        if (lastAttacked == null) return true;
        return millis() - lastAttacked >= attackSpeed;
    }
    protected void resetCooldown() {
        this.lastAttacked = null;
    }

    protected abstract boolean attackConditionSatisfied(Meeple meeple);
    protected abstract void attack(Meeple meeple);
    
    @Override
    public void update(World world) {
        Meeple meeple = world.getMeeple();

        if (meeple != null) {
            this.move(meeple);

            if (this.attackConditionSatisfied(meeple)) {
                if (this.cooldownSatisfied()) {
                    this.attack(meeple);
                    lastAttacked = millis();
                }
            } else {
                resetCooldown();
            }
        }

        super.update(world);
    }
    public abstract void display();
}