import com.prestopy.mrkeyboard.*;

float renderPadding = 100; // Render things __px out of screen
float padding = 500;

PVector offset; // left of screen
float meepleSpeed = 5;

boolean[] pressedDir = {false, false};

World world;

PVector GRAVITY = new PVector(0, 0.5);

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


void draw() {
  background(world.env.getColor());

  
  world.constructWorld(offset);
  world.update();

  // DISPLAY
  pushMatrix();

  translate(-offset.x, offset.y);
  
  textSize(64);
  world.display(offset);

  popMatrix();

  
}