public class Flag extends Item {
    private final int w = 50;
    private final int h = 50;
    Flag() {

    }

    @Override
    public void use(Entity user, World world) {
        throw new Error("Flag doesn't have use() yet");
    }

    @Override
    public void handheldDisplay(Entity user) {
        throw new Error("Knife doesn't have handheld display yet");
    }

    @Override
    public void iconDisplay(PVector pos) {
        fill(255);
        rect(pos.x, pos.y, this.iconW, this.iconH);

        fill(0);
        textSize(16);
        textAlign(CENTER, CENTER);
        text("knife", pos.x+25, pos.y+25);
    }
}