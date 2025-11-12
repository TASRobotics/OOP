public abstract class Displayable {
    protected PVector pos;
    
    Displayable(PVector pos) {
        this.pos = pos;
    }

    public PVector getPos() {
        return pos.copy();
    }
    
    // protected float getBrightness(float dayPercentage) {
    //     if (layer <= 2) return map(1-dayPercentage, 0, 1, 0.8, 0.15);
    //     return map(1-dayPercentage, 0, 1, 0.33, 0.078);
    // }
    
    public abstract void display();
}