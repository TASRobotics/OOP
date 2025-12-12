public abstract class Item implements Killable {
    private boolean isStackable;
    private int durability;
    private boolean isDead = false;

    Item(boolean isStackable) {
        this.isStackable = isStackable;
        this.durability = 1000;
    }
    Item(boolean isStackable, int durability) {
        this.isStackable = isStackable;
        this.durability = durability;
    }

    public boolean getIsDead() {
        return this.isDead;
    }

    public boolean getIsStackable() {
        return this.isStackable;
    }

    // Some items might need to update every tick
    public void update() {}

    public void use(Entity user, World world) {
        durability -= 1;

        if (durability <= 0) isDead = true;

        useAction(user, world);
    };
    public abstract void useAction(Entity user, World world);
    public abstract void handheldDisplay(Entity user);
    // public abstract void entityDisplay(PVector pos); // FIXME: SHOULDN'T BE HERE- SHOULD BE IN SEPARATE ITEM ENTITY CLASS
                                                        // THAT WAY IT CAN MANAGE ITS OWN POSITION, VELOCITY, AND ACCELERATION
    public abstract void iconDisplay(PVector pos);

    @Override
    public abstract boolean equals(Object that);
}