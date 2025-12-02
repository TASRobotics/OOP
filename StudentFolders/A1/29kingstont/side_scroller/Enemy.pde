public abstract class Enemy<T extends Body> extends Entity<T> implements HasHealth {
    private float health;
    private float maxHealth;

    protected float movementSpeed; // px

    private int cooldown; // ms
    protected float damage;
    private Integer lastAttacked;

    Enemy(T body, float movementSpeed, float damage, int cooldown, int maxHealth) {
        super(body);

        this.maxHealth = maxHealth;
        this.health = maxHealth;

        this.movementSpeed = movementSpeed;

        this.damage = damage;
        this.cooldown = cooldown;
    }

    public float getHealth() {
        return this.health;
    }
    public float getMaxHealth() {
        return this.maxHealth;
    }
    public void damage(float h) {
      this.health -= min(this.health, h);
      if (this.health == 0) this.isDead = true;
    }
    public void heal(float h) {
        this.health += min(this.maxHealth-this.health, h);
    }
    
    public void setHealth(float h) {
        this.health = h;
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