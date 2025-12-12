public class LongHealthBar implements Displayable {
    private PVector pos;

    private float barW = 300;
    private float barH = 10;

    private float actualHealth;
    private float maxHealth;

    // animation
    private float displayHealth;
    private float startHealth;
    private float targetHealth;

    private float animStart;
    private float animDuration = 200;

    LongHealthBar(PVector pos, float maxHealth) {
        this.pos = pos;

        this.maxHealth = maxHealth;
        this.actualHealth = this.maxHealth;
        this.displayHealth = this.actualHealth;

        this.startHealth = this.displayHealth;
        this.targetHealth = this.startHealth;

        this.animStart = 0;
    }

    void setHealth(float newHealth) {
        if (this.actualHealth != newHealth) {
            this.startHealth = displayHealth;
            this.targetHealth = newHealth;
            this.animStart = millis();

            this.actualHealth = newHealth;
        }
    }

    void update() {
        float timePassed = millis() - this.animStart;
        float t =  timePassed/this.animDuration;
        t = constrain(t, 0, 1);

        this.displayHealth = lerp(this.startHealth, this.targetHealth, t);
    }

    @Override
    void display() {
        display(color(255));
    }
    
    void display(color c) {
        // Health bar
        
        float barX = this.pos.x;
        float barY = this.pos.y;

        textSize(16);
        fill(c);
        textAlign(LEFT, TOP);
        text("You", barX, barY-20);
        
        noStroke();
        fill(255, 50);
        rect(barX, barY, barW, barH); 

        fill(255);
        textAlign(RIGHT, TOP);
        textSize(16);
        text(""+round(actualHealth), barX+barW, barY-20);

        fill(c);
        float actualHealthW = map(actualHealth, 0, maxHealth, 0, barW);
        rect(barX, barY, actualHealthW, barH);

        if (targetHealth - startHealth > 0) { // healing
            fill(255);
            float changeIndicatorMaxW = map(abs(targetHealth-startHealth), 0, maxHealth, 0, barW);
            float changeIndicatorW = map(displayHealth, startHealth, targetHealth, changeIndicatorMaxW, 0);
            rect(barX+actualHealthW-changeIndicatorW, barY, changeIndicatorW, barH);
        } else {
            fill(RED);
            float changeIndicatorMaxW = map(abs(targetHealth-startHealth), 0, maxHealth, 0, barW);
            float changeIndicatorW = map(displayHealth, startHealth, targetHealth, changeIndicatorMaxW, 0);
            rect(barX+actualHealthW, barY, changeIndicatorW, barH);
        }
    }
}