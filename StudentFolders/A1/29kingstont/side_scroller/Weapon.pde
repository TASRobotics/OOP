public abstract class Weapon extends Item {
    private float cooldown;
    protected float damage;
    private Integer lastUsed;
    protected boolean isInUse = false;

    Weapon(float cooldown, float damage) {
        this.cooldown = cooldown;
        this.damage = damage;
    }

    @Override
    public void update() {}

    @Override
    public void use(Entity user, World world) {
        throw new Error("Please use the other use(). My code is bad ok shut up.");
    }

    public void use(Entity<RectBody> user, ArrayList<Entity> targets) {
        if (cooldownSatisfied() && conditionSatisfied()) {
            this.lastUsed = millis();
            this.isInUse = true;
            attack(user, targets, world);
        }
    }
    public void use(Entity<RectBody> user, Entity target) {
        if (cooldownSatisfied() && conditionSatisfied()) {
            this.lastUsed = millis();
            this.isInUse = true;

            ArrayList<Entity> targets = new ArrayList<Entity>();
            targets.add(target);
            attack(user, targets, world);
        }
    }

    protected abstract void attack(Entity user, ArrayList<Entity> targets, World world);
    protected abstract PVector getOffset(Entity user);
    protected abstract ArrayList<Entity> getTargetsInRange(Entity user, ArrayList<Entity> targets);

    protected ArrayList<Entity> getTargetsInRange(Entity user, Entity target) {
        ArrayList<Entity> targets = new ArrayList<>();
        targets.add(target);
        return getTargetsInRange(user, targets);
    }

    private boolean cooldownSatisfied() {
        if (this.lastUsed == null) return true;
        return millis() - this.lastUsed > this.cooldown;
    }
    protected abstract boolean conditionSatisfied();
}