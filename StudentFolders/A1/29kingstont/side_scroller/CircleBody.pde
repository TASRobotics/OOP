public class CircleBody extends Body {
    float r;

    CircleBody(PVector pos, float r) {
        super(pos, 0);
        this.r = r;
    }
    CircleBody(PVector pos, float r, float mass) {
        super(pos, mass);
        this.r = r;
    }

    @Override
    public PVector getTop() {
        return PVector.add(this.pos, new PVector(0, r));
    }
    @Override
    public PVector getBottom() {
        return PVector.sub(this.pos, new PVector(0, r));
    }
    @Override
    public PVector getCenter() {
        return this.pos;
    }
    public float getR() {
        return this.r;
    }

    @Override
    public void setTop(PVector p) {
        this.pos = p.add(0, r);
    }
    @Override
    public void setBottom(PVector p) {
        this.pos = p.sub(0, r);
    }
    @Override
    public void setCenter(PVector p) {
        this.pos = p;
    }

    @Override
    public void resolveAllCollisions(Entity entity, Terrain rightsideUpTerr, ArrayList<Platform> platforms, boolean isUpsideDown) {
        if (isGrounded(rightsideUpTerr, platforms, isUpsideDown)) {
            float bestY = rightsideUpTerr.getHeightAt(this.pos.x)-this.r;

            entity.vel.y = 0;
            this.pos.y = bestY;
        }
    }

    @Override
    public boolean isGrounded(Terrain rightsideUpTerr, boolean isUpsideDown) {
        float terrH = rightsideUpTerr.getHeightAt(this.pos.x);
        return this.pos.y+this.r >= terrH;
    }

    @Override
    public boolean isGrounded(Terrain rightsideUpTerr, ArrayList<Platform> platforms, boolean isUpsideDown) {
        float terrH = rightsideUpTerr.getHeightAt(this.pos.x);
        boolean isOnFloor = this.pos.y+this.r >= terrH;
        boolean isOnPlatform = false;
        // for (Platform p : platforms) {
        //     if (p.intersects(this)) {
        //         isOnPlatform = true;
        //         break;
        //     }
        // }
        return isOnFloor || isOnPlatform;
    }

    @Override
    public boolean isWithin(float minX, float maxX) {
        return pos.x+r >= minX && pos.x-r <= maxX;
    }
}