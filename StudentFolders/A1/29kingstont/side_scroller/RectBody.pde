public class RectBody extends Body {
    float w, h;

    RectBody(PVector pos, float w, float h) {
        super(pos, 0);
        this.w = w;
        this.h = h;
    }
    RectBody(PVector pos, float w, float h, float mass) {
        super(pos, mass);
        this.w = w;
        this.h = h;
    }

    @Override
    public PVector getTop() {
        return this.pos;
    }
    @Override
    public PVector getBottom() {
        return PVector.add(this.pos, new PVector(0, this.h));
    }
    @Override
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
    public PVector getDim() {
        return new PVector(w, h);
    }

    @Override
    public void setTop(PVector p) {
        this.pos = p;
    }
    @Override
    public void setBottom(PVector p) {
        this.pos = p.sub(0, h);
    }
    @Override
    public void setCenter(PVector p) {
        this.pos = p.sub(w/2, h/2);
    }

    @Override
    public void resolveAllCollisions(Entity entity, Terrain terr, ArrayList<Platform> platforms, boolean isUpsideDown) {
        boolean grounded = false;
        boolean damageExempt = false;

        if (isGrounded(terr, isUpsideDown)) {
            grounded = true;

            entity.getVel().y = 0;

            float terrY = terr.getHeightAt(this);
            if (!isUpsideDown) setBottom(new PVector(pos.x, terrY));
            else setTop(new PVector(pos.x, terrY));
        }

        for (Platform p : platforms) {
            boolean falling = abs(entity.getVel().y) > 0;
            boolean wasAbove = false;
            if (!entity.getIsUpsideDown()) wasAbove = entity.getPrevPos().y+this.h <= p.getPos().y;
            else wasAbove = entity.getPrevPos().y >= p.getPos().y+p.getH();

            if (falling && wasAbove) {
                CollisionResult res = Collision.check(p.getBody(), this);

                boolean correctCollisionPlace;
                if (!entity.getIsUpsideDown()) correctCollisionPlace = res.side == "bottom";
                else correctCollisionPlace = res.side == "top";

                if ((res.collided || wasAbove) && correctCollisionPlace) {
                    grounded = true;

                    entity.getVel().y = 0;
                    this.pos.y -= res.penetration * entity.getDirection();

                    if (p instanceof Trampoline) {
                        damageExempt = true;

                        // Boost jump!
                        entity.getVel().y = -1000 * entity.getDirection();
                    }
                }
            }
        }

        if (grounded) {
             // Fall damage
            if (!damageExempt && entity.getIsFlipping() && entity instanceof HasHealth) {
                HasHealth damageable = (HasHealth) entity;
                damageable.damage(25);
            }

            entity.setgetIsFlipping(false);
        }
    }

    @Override
    public boolean isGrounded(Terrain terr, boolean isUpsideDown) {
        float terrH = terr.getHeightAt(this);

        return !isUpsideDown ? getBottom().y >= terrH : getTop().y <= terrH;
    }

    @Override
    public boolean isGrounded(Terrain terr, ArrayList<Platform> platforms, boolean isUpsideDown) {
        boolean isOnFloor = isGrounded(terr, isUpsideDown);
        boolean isOnPlatform = false;

        for (Platform p : platforms) {
            PVector pPos = p.getPos();
            if (this.pos.x+w >= pPos.x && this.pos.x <= pPos.x+p.getW() && this.pos.y+this.h == pPos.y) {
                isOnPlatform = true;
                break;
            }
        }

        return isOnFloor || isOnPlatform;
    }

    @Override
    public boolean isWithin(float minX, float maxX) {
        return pos.x+w >= minX && pos.x <= maxX;
    }
}