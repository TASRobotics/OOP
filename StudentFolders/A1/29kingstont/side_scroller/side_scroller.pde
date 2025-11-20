import com.prestopy.mrkeyboard.*;
import java.util.HashMap;
import java.util.Map;

float renderPadding = 100; // Render things __px out of screen
float padding = 500;

PVector offset; // left of screen
float meepleSpeed = 200; // px/s

World world;
PVector GRAVITY = new PVector(0, 1_500); // px/s

boolean isGameOver = false;

HashMap<String, Double> log = new HashMap<>();

MrKeyboard keyboard;

void setup() {
  size(1400, 800);
  background(255);
  
  offset = new PVector();

  keyboard = new MrKeyboard(this);
  world = new World(width, keyboard);


  world.attachMeeple(new Meeple(2));
  world.generateDeco(0, world.getWorldWidth());
}

float baseH = 300;


float totalTime = 0;
float dt = 1/10f;

float currentTime = millis();

void draw() {
  if (!isGameOver) {
    float newTime = millis();
    float frameTime = (newTime - currentTime) / 1000f;
    currentTime = newTime;

    dt = min(frameTime, 1/30f);
    frameTime -= dt;
    totalTime += dt;

    logStats("Delta time", dt);


    long t = System.nanoTime(); // DEBUGGER ########################

    world.constructWorld(offset);
    world.update();

    textSize(64);
    textAlign(TOP, LEFT);

    // DISPLAY
    pushMatrix();

    translate(-offset.x, offset.y);
    
    world.display(offset);

    popMatrix();


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
  } else {
    background(255, 0, 0, 10);
    fill(255);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, height/2);
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
  line(x, offset.y, x, height);
}
void horizontalLine(float y) {
  stroke(0, 255, 0);
  line(offset.x, y, width, y);
}

void setGameOver(boolean g) {
  this.isGameOver = g;
}