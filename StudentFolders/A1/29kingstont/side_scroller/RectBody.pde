public class RectBody extends Body {
    float w, h;

    RectBody(PVector pos, float mass, float w, float h, boolean isStatic) {
        super(pos, mass, isStatic);
        this.w = w;
        this.h = h;
    }

    public PVector getCenter() {
        return PVector.add(pos, new PVector(w/2, h/2));
    }

    public float getW() {
        return this.w;
    }
    public float getH() {
        return this.h;
    }

    @Override
    public void collideFloor(Terrain terr, ArrayList<Platform> platforms) {
        if (isGrounded(terr, platforms)) {
            float bestY = terr.getHeightAt(this.pos.x+w/2);

            for (Platform p : platforms) {
                if (this.pos.x+this.w >= p.getPos().x && this.pos.x <= p.getPos().x+p.getW() && this.pos.y+this.h >= p.getPos().y) {
                    bestY = p.getPos().y;
                    break;
                }
            }

            this.vel.y = 0;
            this.pos.y = bestY-this.h;
        }
    }

    @Override
    public boolean isGrounded(Terrain terr) {
        float terrH = terr.getHeightAt(this.pos.x+w/2);
        return this.pos.y+this.h >= terrH;
    }

    @Override
    public boolean isGrounded(Terrain terr, ArrayList<Platform> platforms) {
        float terrH = terr.getHeightAt(this.pos.x+w/2);
        boolean isOnFloor = this.pos.y+this.h >= terrH;
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
        rect(this.pos.x, this.pos.y, this.w, this.h);
    }

    @Override
    public void display(color c) {
        fill(c);
        rect(this.pos.x, this.pos.y, this.w, this.h);
    }
}