public abstract class Item {
    protected final int iconW = 50;
    protected final int iconH = 50;
    Item() {
        
    }

    public abstract void use(Entity user, World world);
    public abstract void handheldDisplay(Entity user);
    // public abstract void entityDisplay(PVector pos); // FIXME: SHOULDN'T BE HERE- SHOULD BE IN SEPARATE ITEM ENTITY CLASS
                                                     // THAT WAY IT CAN MANAGE ITS OWN POSITION, VELOCITY, AND ACCELERATION
    public abstract void iconDisplay(PVector pos);
}