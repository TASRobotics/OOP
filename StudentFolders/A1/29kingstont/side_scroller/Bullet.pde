public class Bullet extends Entity<RectBody> {
    private ArrayList<Entity> targets;
    private float damage;

    private int lifetime;
    private int startOfLife;

    Bullet(PVector pos, PVector vel, PVector acc, float damage, ArrayList<Entity> targets) {
        super(new RectBody(pos, 100, 10, 5)); // 10, 5

        this.damage = damage;
        this.targets = targets;
        this.vel = vel;
        this.acc = acc;

        this.startOfLife = millis();
        this.lifetime = 10*1000;
    }

    @Override
    public void update(World world) {
        super.update(world);
        this.attack();

        if (millis()-this.startOfLife >= this.lifetime) this.die();
    }

    private void attack() {
        for (Entity e : targets) {
            if (!(e instanceof HasHealth) || e.isDead()) continue;
            HasHealth damageable = (HasHealth) e;

            if (e.getBody() instanceof RectBody) {
                if (Collision.check((RectBody) e.getBody(), this.getBody()).collided) {
                    damageable.damage(this.damage);
                    this.die();
                }
            } else if (e.getBody() instanceof CircleBody) {
                if (Collision.check((CircleBody) e.getBody(), this.getBody()).collided) {
                    damageable.damage(this.damage);
                    this.die();
                }
            }
        }
    }

    @Override
    public void display() {
        fill(255, 0, 0);
        noStroke();
        rect(this.getPos().x, this.getPos().y, this.getBody().getW(), this.getBody().getH());
    }
}