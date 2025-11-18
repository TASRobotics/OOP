class Platform extends Displayable {
    RectBody platform;

    // THERE EXIST TWO POSITIONS...
    Platform(PVector pos, float w, float h) {
        super(pos);
        platform = new RectBody(pos, 1, w, h, true);
    }

    public PVector getPos() {
        return this.platform.getPos();
    }

    public float getW() {
        return this.platform.getW();
    }
    public float getH() {
        return this.platform.getH();
    }

    public boolean intersects(RectBody body) {
        PVector pos = body.getPos();
        PVector thisPos = this.getPos();

        return pos.x+body.getW() >= thisPos.x && pos.x <= thisPos.x+this.getW() && pos.y+body.getH() >= thisPos.y;
    }
    public boolean intersects(CircleBody body) {
        PVector pos = body.getPos();
        PVector thisPos = this.getPos();
        return pos.x >= thisPos.x && pos.x <= thisPos.x+this.getW() && pos.y+body.getR() >= thisPos.y;
    }

    public void display() {
        fill(255);
        stroke(0);
        strokeWeight(2);
        rect(pos.x, pos.y, this.getW(), this.getH());
    }
}