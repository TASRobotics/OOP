static int entityCount = 0;

public abstract class Entity<T extends Body> {
    public int id;
    protected T body;
    protected float health;
    protected float maxHealth;

    Entity(T body) {
        this.id = entityCount;
        this.body = body;

        this.maxHealth = 100;
        this.health = this.maxHealth;

        entityCount++;
    }

    public T getBody() {
        return this.body;
    }

    public PVector getCenter() {
        return this.body.getPos();
    };
    public PVector getPos() {
        return this.body.getPos();
    }
    public PVector getVel() {
        return this.body.getVel();
    }
    public PVector getAcc() {
        return this.body.getAcc();
    }
    public float getMass() {
        return this.body.getMass();
    }
    public float getHealth() {
        return this.health;
    }
    public float getMaxHealth() {
        return this.maxHealth;
    }

    public void setPos(PVector pos) {
        this.body.setPos(pos);
    }
    public void setVel(PVector vel) {
        this.body.setVel(vel);
    }
    public void stop() {
        this.body.setVel(new PVector(0, 0));
        this.body.setAcc(new PVector(0, 0));
    }
    public void setAcc(PVector acc) {
        this.body.setAcc(acc);
    }

    public void damage(float h) {
        this.health -= min(this.health, h);
    }
    public void heal(float h) {
        this.health += min(this.maxHealth-this.health, h);
    }

    public void applyForce(PVector F) {
        this.body.applyForce(F);
    }


    public void update(World world) {
        this.body.update(world);
    }
    public abstract void display();

    public void displayHp() {
        float barX = 0;
        float barY = 0;
        float barW = 0;
        float barH = 0;

        if (body instanceof RectBody) {
            RectBody body = (RectBody) this.body;
            barW = 80;
            barH = 15;
            barX = this.getPos().x+body.getW()/2-barW/2;
            barY = this.getPos().y - 50;
        } else if (body instanceof CircleBody) {
            barX = this.getPos().x;
            barY = this.getPos().y - 50;
            barW = 80;
            barH = 15;
        }

        stroke(0);
        strokeWeight(1);
        fill(255/2);
        rect(barX, barY, barW, barH); 

        fill(255, 0, 0);
        rect(barX, barY, map(health, 0, maxHealth, 0, barW), barH);
    }
}