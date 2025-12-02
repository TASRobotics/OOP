public class Knife extends Weapon {
    private int hitboxW;
    private int hitboxH;

    Knife() {
        super(400, 40);
        this.hitboxW = 50;
        this.hitboxH = 30;
    }
    Knife(int cooldown, float damage, int w, int h) {
        super(cooldown, damage);
        this.hitboxW = w;
        this.hitboxH = h;
    }

    @Override
    protected boolean conditionSatisfied() { return true; }

    @Override
    protected void attack(Entity user, ArrayList<Entity> targets, World world) {
        if (!(user.getBody() instanceof RectBody)) throw new Error("I'm too lazy to make this work for circle bodies so this will only work for rectangles!!!");

        Entity<RectBody> rectUser = (Entity<RectBody>) user;

        PVector hitboxPos = rectUser.getPos().copy();
        hitboxPos.add(this.getOffset(user));
        RectBody hitbox = new RectBody(hitboxPos, hitboxW, hitboxH, 0);

        ArrayList<Entity> targetsInRange = getTargetsInRange(user, targets);

        for (Entity e : targetsInRange) {
            if (e instanceof HasHealth) {
                HasHealth hpEntity = (HasHealth) e;
                hpEntity.damage(this.damage);
            }
        }
    }

    @Override
    protected ArrayList<Entity> getTargetsInRange(Entity user, ArrayList<Entity> targets) {
        if (!(user.getBody() instanceof RectBody)) throw new Error("I'm too lazy to make this work for circle bodies so this will only work for rectangles!!!");

        Entity<RectBody> rectUser = (Entity<RectBody>) user;

        PVector hitboxPos = rectUser.getPos().copy();
        hitboxPos.add(this.getOffset(user));
        RectBody hitbox = new RectBody(hitboxPos, hitboxW, hitboxH, 0);

        ArrayList<Entity> targetsInRange = new ArrayList<>();

        for (Entity e : targets) {
            if (e.isDead()) continue;
            
            if (e.getBody() instanceof RectBody) {
                if (Collision.check((RectBody) e.getBody(), hitbox).collided) {
                    targetsInRange.add(e);
                }
            } else if (e.getBody() instanceof CircleBody) {
                if (Collision.check((CircleBody) e.getBody(), hitbox).collided) {
                    targetsInRange.add(e);
                }
            }
        }

        return targetsInRange;
    }

    @Override
    protected PVector getOffset(Entity user) {
        if (!(user.getBody() instanceof RectBody)) throw new Error("I'm too lazy to make this work for circle bodies so this will only work for Meeple!!!");

        Entity<RectBody> rectUser = (Entity<RectBody>) user;
        RectBody rectUserBody = rectUser.getBody();

        PVector offset = new PVector();
        if (user.getIsFacingRight()) {
            offset.x = rectUserBody.getW();
            offset.y = rectUserBody.getH()/2-hitboxH/2;
        } else {
            offset.x = -hitboxW;
            offset.y = rectUserBody.getH()/2-hitboxH/2;
        }

        return offset;
    }

    @Override
    public void handheldDisplay(Entity user) {
        if (!this.isInUse) fill(255, 80);
        else fill(255, 0, 0);

        PVector offset = this.getOffset(user);
        rect(user.getPos().x+offset.x, user.getPos().y+offset.y, hitboxW, hitboxH);
        
        this.isInUse = false;
    }

    @Override
    public void iconDisplay(PVector pos) {
        fill(255);
        noStroke();
        rect(pos.x, pos.y, ICON_W, ICON_H);

        fill(0);
        textSize(16);
        textAlign(CENTER, CENTER);
        text("knife", pos.x+25, pos.y+25);

        // throw new Error("Knife doesn't have entity display yet");
    }
}