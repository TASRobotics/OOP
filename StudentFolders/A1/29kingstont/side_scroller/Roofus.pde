public class Roofus extends BoringZombie {
    private int numAttacks = 0;
    private final int spawnEvery = 1;
    Roofus(PVector pos) {
        super(pos, 1, 2, 1000, 50);
    }

    @Override
    protected void attack(World world) {
        Meeple meeple = world.getMeeple();
        if (meeple == null) return;

        weapon.use(this, meeple);
        numAttacks++;

        if (numAttacks % spawnEvery == 0) {
            float enemyX = random(world.getOffset().x, world.getOffset().x+width);
            Enemy enemy = new Minion(new PVector(enemyX, 500));
            world.createEnemy(enemy);
        }
    }

    @Override
    public void display() {
        stroke(0);
        strokeWeight(1);
        fill(5, 224, 195);
        
        PVector pos = this.getPos();
        RectBody body = this.getBody();
        rect(pos.x, pos.y, body.getW(), body.getH());
        
        this.weapon.handheldDisplay(this);

        displayHp(this);
    }
}