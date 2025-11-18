public class CircleBody extends Body {
    float r;

    CircleBody(PVector pos, float mass, float r, boolean isStatic) {
        super(pos, mass, isStatic);
        this.r = r;
    }

    public float getR() {
        return r;
    }

    public PVector getCenter() {
        return this.pos;
    }

    @Override
    public void collideFloor(Terrain terr, ArrayList<Platform> platforms) {
        if (isGrounded(terr, platforms)) {
            float bestY = terr.getHeightAt(this.pos.x)-this.r;

            for (Platform p : platforms) {
                if (p.intersects(this)) {
                    bestY = p.getPos().y-this.r;
                    break;
                }
            }

            this.vel.y = 0;
            this.pos.y = bestY;
        }
    }

    @Override
    public boolean isGrounded(Terrain terr) {
        float terrH = terr.getHeightAt(this.pos.x);
        return this.pos.y+this.r >= terrH;
    }

    @Override
    public boolean isGrounded(Terrain terr, ArrayList<Platform> platforms) {
        float terrH = terr.getHeightAt(this.pos.x);
        boolean isOnFloor = this.pos.y+this.r >= terrH;
        boolean isOnPlatform = false;
        for (Platform p : platforms) {
            if (p.intersects(this)) {
                isOnPlatform = true;
                break;
            }
        }
        return isOnFloor || isOnPlatform;
    }

    @Override
    public void display() {
        fill(255);
        circle(this.pos.x, this.pos.y, this.r*2);
    }

    @Override
    public void display(color c) {
        fill(c);
        circle(this.pos.x, this.pos.y, this.r*2);
    }
}