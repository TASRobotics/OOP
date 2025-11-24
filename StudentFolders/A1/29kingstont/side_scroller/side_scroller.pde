import com.prestopy.mrkeyboard.*; // IMPORTANT: Install the MrKeyboard library @ https://github.com/Prestopy/mrkeyboard
import java.util.HashMap;
import java.util.Map;

private MrKeyboard keyboard;

public color RED = color(255, 0, 0);
public color GREEN = color(5, 219, 73);

private World world;
private PVector GRAVITY = new PVector(0, 1_500); // px/s

private float lastTime;
private float totalTime = 0;
private float dt = 1/10f; // Delta time (initialize with )

private boolean isGameOver = false;
private boolean showStats = false;

private HashMap<String, Double> log = new HashMap<>();

private LongHealthBar meepleHealthBar;

void setup() {
  size(1400, 800);
  background(255);

  keyboard = new MrKeyboard(this);
  lastTime = millis();

  world = new World(width, keyboard);

  world.attachMeeple(new Meeple(2));
  world.generateDeco(0, world.getWorldWidth());

  meepleHealthBar = new LongHealthBar(new PVector(50, 50), world.getMeeple().getMaxHealth());
}

void draw() {
  if (!isGameOver) {
    // Calculate delta time
    float newTime = millis();
    float frameTime = (newTime - lastTime) / 1000f;
    lastTime = newTime;

    dt = min(frameTime, 1/30f);
    // frameTime -= dt;
    totalTime += dt;

    logStats("Delta time", dt);


    long t = System.nanoTime(); // DEBUGGER ########################

    // Update
    world.constructWorld();
    world.update();

    if (keyboard.isKeyTapped('t')) showStats = !showStats;

    // Display
    textSize(64);
    textAlign(TOP, LEFT);

    pushMatrix();
    PVector offset = world.getOffset();
    translate(-offset.x, offset.y);
    world.display();
    popMatrix();

    Meeple meeple = world.getMeeple();

    // Tint screen red the lower the player's health goes
    if (meeple.getHealth() <= 40) {
      fill(255, 0, 0, map(meeple.getHealth(), 0, 40, 100, 0));
      noStroke();
      rect(0, 0, width, height);
    }
    
    // Health bar
    meepleHealthBar.setHealth(meeple.getHealth());
    meepleHealthBar.update();
    meepleHealthBar.display(GREEN);

    // Items
    ArrayList<Item> meepleItems = world.items;
    PVector nowPos = new PVector(50, 700);
    for (int i=0; i<meepleItems.size(); i++) {
      meepleItems.get(i).iconDisplay(nowPos.copy());
      nowPos.x += 50;
    }

    // Statistics
    if (showStats) {
      logStats("Draw loop", (System.nanoTime() - t)/1e6); // DEBUGGER #######

      fill(0, 255, 0);
      text(round(frameRate) + " / " + totalTime, 10, 50);

      int idx = 0;
      textSize(32);

      for (Map.Entry<String, Double> entry : log.entrySet()) {
        String key = entry.getKey();
        Double value = entry.getValue();

        // if (value < 0.1) continue;

        text(key + ": " + String.format("%.3f%n", value), 10, 50+32*(idx+1));

        idx++;
      }
    }
  } else {
    fill(255, 0, 0, 5);
    noStroke();
    rect(0, 0, width, height);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text("GAME OVER", width/2, height/2);
    text("You survived for " + floor(totalTime) + " seconds", width/2, height/2+32);
  }
}

float dt() { // seconds / frame
  return dt; // frame / seconds
}

void logStats(String title, double time) {
  double ms = time;

  log.put(title, ms);
}


void verticalLine(float x) {
  stroke(0, 255, 0);
  line(x, this.world.getOffset().y, x, height);
}
void horizontalLine(float y) {
  stroke(0, 255, 0);
  line(this.world.getOffset().x, y, width, y);
}

void setGameOver(boolean g) {
  this.isGameOver = g;
}