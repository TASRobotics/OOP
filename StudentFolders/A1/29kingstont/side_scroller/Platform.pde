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
    public RectBody getBody() {
        return this.platform;
    }

    public float getW() {
        return this.platform.getW();
    }
    public float getH() {
        return this.platform.getH();
    }

    public void display() {
        fill(255);
        stroke(0);
        strokeWeight(1);

        rect(pos.x, pos.y, this.getW(), this.getH());
    }
}