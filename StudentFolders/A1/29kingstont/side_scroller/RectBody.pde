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

    public float getX() {
        return this.pos.x;
    }
    public float getY() {
        return this.pos.y;
    }
    public float getW() {
        return this.w;
    }
    public float getH() {
        return this.h;
    }

    @Override
    public void collide(Terrain terr, ArrayList<Platform> platforms) {
        if (isGrounded(terr)) {
            float terrY = terr.getHeightAt(this.pos.x+w/2);

            this.vel.y = 0;
            this.pos.y = terrY-this.h;
        }

        for (Platform p : platforms) {
            boolean falling = this.vel.y > 0;
            boolean wasAbove = this.prevPos.y+this.h <= p.getPos().y;

            if (falling && wasAbove) {
                CollisionResult res = Collision.check(p.getBody(), this);
                if (res.collided && res.side == "bottom") {
                    this.vel.y = 0;
                    this.pos.y -= res.penetration;
                }
            }
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
            PVector pPos = p.getPos();
            if (this.getX()+this.w >= pPos.x && this.getX() <= pPos.x+p.getW() && this.getY()+this.h == pPos.y) {
                isOnPlatform = true;
                break;
            }
        }

        return isOnFloor || isOnPlatform;
    }
}