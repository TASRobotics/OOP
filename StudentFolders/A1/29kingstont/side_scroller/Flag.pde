public class Flag extends Item {
    private final int w = 50;
    private final int h = 50;
    Flag() {
        super(true);
    }

    @Override
    public void useAction(Entity user, World world) {
        throw new Error("Flag doesn't have use() yet");
    }

    @Override
    public void handheldDisplay(Entity user) {
        // throw new Error("Flag doesn't have handheld display yet");
    }

    @Override
    public void iconDisplay(PVector pos) {
        fill(255);
        noStroke();
        rect(pos.x, pos.y, Constants.BLOCK_UNIT, Constants.BLOCK_UNIT);

        fill(0);
        textSize(16);
        textAlign(CENTER, CENTER);
        text("flag", pos.x+25, pos.y+25);
    }

    @Override
    public boolean equals(Object that) {
        return that instanceof Flag; // there are no flag variants
    }
}