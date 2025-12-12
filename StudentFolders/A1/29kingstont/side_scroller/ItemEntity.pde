public class ItemEntity extends Entity<RectBody> implements Displayable {
    Item item;
    ItemEntity(PVector pos, Item item) {
        super(new RectBody(pos, Constants.BLOCK_UNIT, Constants.BLOCK_UNIT, 1));
        this.item = item;
    }
    ItemEntity(PVector pos, Item item, boolean isUpsideDown) {
        super(new RectBody(pos, Constants.BLOCK_UNIT, Constants.BLOCK_UNIT, 1), isUpsideDown);
        this.item = item;
    }

    public Item collect() {
        die();
        return this.item;
    }

    @Override
    public void display() {
        item.iconDisplay(getPos());
    }
}