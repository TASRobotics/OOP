class Platform implements Displayable {
    RectBody platform;

    // THERE EXIST TWO POSITIONS...
    Platform(PVector pos, int w, int h) {
        platform = new RectBody(pos, w, h);
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
        fill(PLATFORM_BLUE);
        noStroke();

        drawWavyBox2(platform, 5, PLATFORM_BLUE, PLATFORM_BLUE);

        // rect(this.getPos().x, this.getPos().y, this.getW(), this.getH());
    }
}