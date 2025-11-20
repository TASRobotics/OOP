public abstract class Item extends Entity {
    Item(PVector pos) {
        super(new RectBody(pos, 1, 50, 50, false));
    }
}