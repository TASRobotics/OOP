public class ShootingThing extends Weapon {
    private float w, h;

    private int totalAmmo;

    private int loadedAmmo;
    private int maxAmmo;

    private boolean isReloading;
    private int reloadSpeed;
    private int reloadStart;

    ShootingThing() {
        super(200, 15);
        this.w = 35;
        this.h = 20;

        this.totalAmmo = 128;
        this.maxAmmo = 16;
        this.loadedAmmo = maxAmmo;

        this.reloadSpeed = 1500;
        this.isReloading = false;
    }
    ShootingThing(int cooldown, float damage, int maxAmmo, int reloadSpeed) {
        super(cooldown, damage);
        this.w = 35;
        this.h = 30;

        this.totalAmmo = 128;
        this.maxAmmo = maxAmmo;
        this.loadedAmmo = maxAmmo;

        this.reloadSpeed = reloadSpeed;
        this.isReloading = false;
    }

    public int getMaxAmmo() {
        return this.maxAmmo;
    }
    public int getLoadedAmmo() {
        return this.loadedAmmo;
    }
    public int getTotalAmmo() {
        return this.totalAmmo;
    }
    public boolean getIsReloading() {
        return this.isReloading;
    }

    @Override
    protected boolean conditionSatisfied() {
        return loadedAmmo > 0 && !isReloading;
    }

    @Override
    protected void attack(Entity user, ArrayList<Entity> targets, World world) {
        if (!(user.getBody() instanceof RectBody)) throw new Error("I'm too lazy to make this work for circle bodies so this will only work for rectangles!!!");

        Entity<RectBody> rectUser = (Entity<RectBody>) user;

        PVector bulletPos = rectUser.getPos().copy();
        bulletPos.add(this.getOffset(user)).add(0, h/2);

        PVector bulletVel = new PVector(900, 0).mult(user.getIsFacingRight() ? 1 : -1);
        PVector bulletAcc = new PVector(10, 0).mult(user.getIsFacingRight() ? -1 : 1);
        world.createBullet(new Bullet(bulletPos, bulletVel, bulletAcc, this.damage, targets));
        loadedAmmo--;

        if (loadedAmmo <= 0) {
            this.reload();
        }
    }

    public void reload() {
        if (this.loadedAmmo == this.maxAmmo) return;

        this.reloadStart = millis();
        this.isReloading = true;
    }

    @Override
    public void update() {
        if (this.isReloading && millis()-reloadStart >= reloadSpeed) {
            int ammoToTake = min(this.totalAmmo, this.maxAmmo-this.loadedAmmo);
            this.totalAmmo -= ammoToTake;
            this.loadedAmmo += ammoToTake;
            this.isReloading = false;
        }
    }

    @Override
    protected ArrayList<Entity> getTargetsInRange(Entity user, ArrayList<Entity> targets) {
        // FIXME
        return targets;
    }

    @Override
    protected PVector getOffset(Entity user) {
        if (!(user.getBody() instanceof RectBody)) throw new Error("I'm too lazy to make this work for circle bodies so this will only work for Meeple!!!");

        Entity<RectBody> rectUser = (Entity<RectBody>) user;
        RectBody rectUserBody = rectUser.getBody();

        PVector offset = new PVector();
        if (user.getIsFacingRight()) {
            offset.x = rectUserBody.getW();
            offset.y = rectUserBody.getH()/2-h/2;
        } else {
            offset.x = -w;
            offset.y = rectUserBody.getH()/2-h/2;
        }

        return offset;
    }

    @Override
    public void handheldDisplay(Entity user) {
        if (!this.isInUse) fill(50);
        else fill(255, 0, 0);
        
        PVector offset = this.getOffset(user);
        if (this.isInUse) verticalLine(user.getPos().x+offset.x);

        rect(user.getPos().x+offset.x, user.getPos().y+offset.y, w, h);

        this.isInUse = false;
    }

    @Override
    public void iconDisplay(PVector pos) {
        fill(255);
        noStroke();
        rect(pos.x, pos.y, Constants.BLOCK_UNIT, Constants.BLOCK_UNIT);

        fill(0);
        textSize(16);
        textAlign(CENTER, CENTER);
        text("gun", pos.x+25, pos.y+25);

        // throw new Error("Knife doesn't have entity display yet");
    }
}