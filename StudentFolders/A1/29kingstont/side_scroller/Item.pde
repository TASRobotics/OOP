static final int ICON_W = 40;
static final int ICON_H = 40;

public abstract class Item {
    Item() {
        
    }

    // Some items might need to update every tick
    public void update() {}

    public abstract void use(Entity user, World world);
    public abstract void handheldDisplay(Entity user);
    // public abstract void entityDisplay(PVector pos); // FIXME: SHOULDN'T BE HERE- SHOULD BE IN SEPARATE ITEM ENTITY CLASS
                                                        // THAT WAY IT CAN MANAGE ITS OWN POSITION, VELOCITY, AND ACCELERATION
    public abstract void iconDisplay(PVector pos);
}