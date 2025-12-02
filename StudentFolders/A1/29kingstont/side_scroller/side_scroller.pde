import com.prestopy.mrkeyboard.*; // IMPORTANT: Install the MrKeyboard library @ https://github.com/Prestopy/mrkeyboard
import java.util.HashMap;
import java.util.Map;

public class LogEntry {
  String title;
  double value;

  LogEntry(String title, double value) {
    this.title = title;
    this.value = value;
  }
}

private MrKeyboard keyboard;

public color RED = color(255, 0, 0);
public color GREEN = color(5, 219, 73);
public color BLUE = color(0, 207, 255);
public color ORANGE = color(236, 106, 0);
public color BROWN = color(72, 50, 27);

public color PLATFORM_BLUE = color(0, 28, 54);

private World world;
private PVector GRAVITY = new PVector(0, 1_500); // px/s

private float lastTime;
private float totalTime = 0;
private float dt = 1/10f; // Delta time (initialize with )

private boolean isGameOver = false;

// private HashMap<String, Double> log = new HashMap<>();
// private HashMap<String, Double> generalLog = new HashMap<>();

private ArrayList<LogEntry> log = new ArrayList<>();
private ArrayList<LogEntry> generalLog = new ArrayList<>();

private LongHealthBar meepleHealthBar;

// DEBUGGING!!
private boolean showStats = false;
ArrayList<Float> verticals = new ArrayList<>();
ArrayList<Float> horizontals = new ArrayList<>();

void setGameOver(boolean g) {
  this.isGameOver = g;
}

void setup() {
  size(1400, 900, P2D);
  // fullScreen(P2D);
  background(255);
  pixelDensity(1);
  frameRate(60);

  keyboard = new MrKeyboard(this);
  lastTime = millis();

  world = new World(width, keyboard);

  world.attachMeeple(new Meeple(2));
  world.generateDeco(0, world.getWorldWidth());

  if (world.getMeeple() != null) meepleHealthBar = new LongHealthBar(new PVector(50, 50), world.getMeeple().getMaxHealth());
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


    long t = System.nanoTime(); // DEBUGGER ########################

    // Update
    world.constructWorld();
    world.update();

    if (keyboard.isKeyTapped('t')) showStats = !showStats;

    // Display
    textSize(64);
    textAlign(TOP, LEFT);

    // Draw world
    pushMatrix();
    PVector offset = world.getOffset();
    translate(-offset.x, offset.y);
    world.display();
    popMatrix();


    // Draw UI & an assortment of others
    long t_UI = System.nanoTime();
    Meeple meeple = world.getMeeple();
    if (meeple != null) {
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

      // Item bar
      ArrayList<Item> items = world.getItems();
      Item currentlySelected = meeple.getCurrentlyHeldItem();
      float padding = 20;
      PVector nowPos = new PVector(50, height-ICON_H-50);

      for (int i=0; i<MAX_ITEMS; i++) {
        if (i < items.size()) {
          Item currentItem = items.get(i);
          currentItem.iconDisplay(nowPos);
        } else {
          noStroke();
          fill(255, 50);
          rect(nowPos.x, nowPos.y, ICON_W, ICON_H);
        }

        if (world.getSelectedItemIndex() == i) {
            stroke(ORANGE);
            strokeWeight(4);
            noFill();
            rect(nowPos.x, nowPos.y, ICON_W, ICON_H);
          }

        nowPos.x += ICON_W+padding;
      }


      // Bullets
      textAlign(CENTER, CENTER);
      if (meeple.getCurrentlyHeldItem() instanceof ShootingThing) {
        ShootingThing gun = (ShootingThing) meeple.getCurrentlyHeldItem();

        if (gun.getIsReloading()) fill(255, 255/2);
        else fill(255);

        textSize(32);
        text(gun.getLoadedAmmo() + "/" + gun.getMaxAmmo(), width-50, height-50);
        textSize(16);
        text(gun.getTotalAmmo(), width-50, height-18);

        if (gun.getIsReloading()) text("reloading...", width-50, height-82);
      }
    }
    logStats("DISPLAY UI & other", timeDiffFromNano(t_UI));




    // Debugging
    if (showStats) {
      textAlign(RIGHT,TOP);
      logGeneralStats("TOTAL Draw loop", (System.nanoTime() - t)/1e6); // DEBUGGER #######

      fill(0, 255, 0);
      textSize(64);
      text(round(frameRate) + " / " + int(dt()*1000)/1000f, width-10, 10);

      textSize(32);
      fill(meeple.isUpsideDown() ? ORANGE : BLUE);
      text(meeple.isUpsideDown() ? "UPSIDE DOWN" : "RIGHTSIDE UP", width-10, 74);

      
      int idx = 0;

      for (LogEntry e : log) {
        String key = e.title;
        Double value = e.value;

        // if (value < 0.1) continue;

        textSize(32);
        if (value < 10) fill(0, 255, 0);
        else fill(255, 0, 0);
        text(key + ": " + String.format("%.3f%n", value), width-10, 74+32+32*(idx+1));

        idx++;
      }

      int jdx = 0;
      for (LogEntry e : generalLog) {
        String key = e.title;
        Double value = e.value;

        // if (value < 0.1) continue;

        textSize(32);
        if (value < 10) fill(255, 255, 0);
        else fill(255, 0, 0);
        text(key + ": " + String.format("%.3f%n", value), width-10, 74+32+32*(idx+1)+32*(jdx+1));

        jdx++;
      }

      log.clear();
      generalLog.clear();


      RectBody meepleBody = meeple.getBody();
      verticalLine(meepleBody.getPos().x);
      verticalLine(meepleBody.getPos().x+meepleBody.getW());
      horizontalLine(meepleBody.getTop().y);
      horizontalLine(meepleBody.getBottom().y);
    }

    for (Float h : horizontals) {
      stroke(0, 255, 0);
      strokeWeight(1);
      line(0, h-this.world.getOffset().y, width, h-this.world.getOffset().y);
    } horizontals.clear();

    for (Float v : verticals) {
      stroke(0, 255, 0);
      strokeWeight(1);
      line(v-this.world.getOffset().x, 0, v-this.world.getOffset().x, height);
    } verticals.clear();
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

void logStats(String title, double number) {
  log.add(new LogEntry(title, number));
}
void logGeneralStats(String title, double number) {
  generalLog.add(new LogEntry(title, number));
}

double timeDiffFromNano(double nano) {
  return (System.nanoTime()-nano) / 1e6;
}

void verticalLine(float x) {
  verticals.add(x);
}
void horizontalLine(float y) {
  horizontals.add(y);
}
void intersectingLines(float x, float y) {
  verticalLine(x);
  horizontalLine(y);
}

void displayHp(Entity o) {
  if (!(o instanceof HasHealth)) throw new Error("Cannot display HP on a non-HP entity");

  HasHealth hpEntity = (HasHealth) o;
  if (hpEntity.getHealth() == hpEntity.getMaxHealth()) return;

  float barX = 0;
  float barY = 0;
  float barW = 80;
  float barH = 10;

  Body body = o.getBody();

  if (body instanceof RectBody) {
      RectBody rectBody = (RectBody) body;
      
      barX = o.getPos().x+rectBody.getW()/2-barW/2;
      barY = o.getPos().y - 40;
  } else if (body instanceof CircleBody) {
      barX = o.getPos().x;
      barY = o.getPos().y - 40;
  }

  stroke(0);
  strokeWeight(1);
  fill(80);
  rect(barX, barY, barW, barH); 

  fill(255, 0, 0);
  rect(barX, barY, map(hpEntity.getHealth(), 0, hpEntity.getMaxHealth(), 0, barW), barH);
}

void drawWavyBox(PVector pos, int w, int h, int waveMaxSideLen, boolean isUpsideDown) {
  fill(PLATFORM_BLUE);
  noStroke();

  // Main rectangle (non-wavy fallback)
  if (!isUpsideDown) rect(pos.x, pos.y, w, h);
  else rect(pos.x, 0, w, h);

  // Wavy decoration
  fill(PLATFORM_BLUE);
  noStroke();
  beginShape();

  int topY = isUpsideDown ? int(pos.y+h) : int(pos.y);
  int bottomY = isUpsideDown ? int(pos.y) : int(topY + h);
  int direction = isUpsideDown ? -1 : 1;

  // ---- Left side waviness ----
  vertex(pos.x, topY);
  vertex(pos.x, isUpsideDown ? 0 : height);

  if (!isUpsideDown) {
    for (int i = height; i >= topY; i--) {
      float wv = noise(i/100f);
      vertex(pos.x - map(wv, 0, 1, 0, waveMaxSideLen), i);
    }
  } else {
    for (int i = 0; i <= topY; i++) {
      float wv = noise(i/100f);
      vertex(pos.x - map(wv, 0, 1, 0, waveMaxSideLen), i);
    }
  }

  // ---- Top/Bottom surface waviness ----
  for (int x = int(pos.x); x <= int(pos.x + w); x++) {
    float nh = noise(x/100f);
    vertex(x, topY - map(nh, 0, 1, 0, waveMaxSideLen) * direction);
  }

  // ---- Right side waviness ----
  if (!isUpsideDown) {
    for (int i = topY; i <= height; i++) {
      float wv = noise(i/100f);
      vertex(pos.x + w + map(wv, 0, 1, 0, waveMaxSideLen), i);
    }
  } else {
    for (int i = topY; i >= 0; i--) {
      float wv = noise(i/100f);
      vertex(pos.x + w + map(wv, 0, 1, 0, waveMaxSideLen), i);
    }
  }

  vertex(pos.x + w, isUpsideDown ? 0 : height);
  vertex(pos.x + w, topY);

  endShape(CLOSE);
}

void drawWavyBox2(RectBody box, int waveMaxSideLen, color rect, color wave) {
  PVector pos = box.getPos();
  float w = box.getW();
  float h = box.getH();

  if (!MINIMIZE_GRAPHICS) {
    // Wavy decoration (clockwise)
    fill(wave);
    noStroke();
    beginShape();

    int leftX = int(pos.x);
    int rightX = int(pos.x+w);

    int topY = int(pos.y);
    int bottomY = int(pos.y+h);

    int increment = 10;

    // ---- Left side waviness ----
    for (int y = bottomY; y >= topY; y-=increment) {
      float wv = noise(y/100f);
      vertex(leftX - map(wv, 0, 1, 0, waveMaxSideLen), y);
    }

    // ---- Top surface waviness ----
    for (int x = leftX; x <= rightX; x+=increment) {
      float nh = noise(x/100f);
      vertex(x, topY - map(nh, 0, 1, 0, waveMaxSideLen));
    }

    // ---- Right side waviness ----
    for (int y = topY; y <= bottomY; y+=increment) {
      float wv = noise(y/100f);
      vertex(rightX + map(wv, 0, 1, 0, waveMaxSideLen), y);
    }

    // ---- Bottom side waviness ----
    for (int x = rightX; x >= leftX; x-=increment) {
      float nh = noise(x/100f);
      vertex(x, bottomY + map(nh, 0, 1, 0, waveMaxSideLen));
    }

    endShape(CLOSE);
  }

  fill(rect);
  noStroke();

  // Main rectangle
  rect(pos.x, pos.y, w, h);
}