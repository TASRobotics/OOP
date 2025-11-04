int MAX_LAYER = 10;

class World {
  private Terrain terr;
  private Environment env;
  private float t;
  private float decoDensity = 10/1600f;
  private Layer[] layers = new Layer[MAX_LAYER+1]; // 0 thru 10; 0 is foreground; 10 is background
  private Meeple meeple;

  private MrKeyboard keyboard;

  World(int worldWidth, MrKeyboard keyboard) {
    this.terr = new Terrain(worldWidth);
    this.env = new Environment();
    this.keyboard = keyboard;

    for (int i=0; i<layers.length; i++) {
      layers[i] = new Layer();
    }
  }

  public int getWorldWidth() {
    return terr.maxX - terr.minX;
  }

  public void update() {
    // UPDATE PLAYER
    for (int i=0; i<layers.length; i++) {
      layers[i].startFrame();
    }

    if (meeple != null) {
      if (keyboard.isKeyDown('A')) {
        meeple.moveX(-meepleSpeed);
      }
      if (keyboard.isKeyDown('D')) {
        meeple.moveX(meepleSpeed);
      }
      if (keyboard.isKeyDown(' ')) {
        meeple.jump();
      }
      
      if (meeple.pos.x+meeple.w-offset.x >= width-padding) {
        offset.x += (meeple.pos.x+meeple.w-offset.x)-(width-padding);
      } else if (meeple.pos.x-offset.x <= padding) {
        offset.x -= padding-(meeple.pos.x-offset.x);
      }
      
      meeple.applyForce(GRAVITY);
      meeple.update(world);
      layers[meeple.getLayer()].submitDynamicItem(meeple);
    }

    env.advanceTime();
  }

  public void attachPlayer(Meeple meeple) {
    this.meeple = meeple;
  }


  void display(PVector offset) {
    int totalItems = 0;
    for (int i=layers.length-1; i>=0; i--) {
      totalItems += layers[i].getNumItems();
      layers[i].display(offset);
    }

    text(totalItems, mouseX+offset.x, mouseY+offset.y);
    terr.display();

    // Darken based on time
    float dayPercentage = env.getDayPercentage();
    float alpha = map(dayPercentage, 0, 1, 255/2, 0);
    fill(0, alpha);
    rect(offset.x, offset.y, width, height);
  }




  // Generate new parts as the meeple moves
  // "Construct world" just sounded cool, but generateWorld prob is better name no
  public void constructWorld(PVector offset) {
    int constructW = int(renderPadding);
    if (offset.x <= terr.minX + renderPadding) {
      int maxX = terr.minX;
      int minX = terr.minX-constructW;
      terr.constructLeft(constructW);
      generateDeco(minX, maxX);
    }
    if (offset.x+width >= terr.maxX - renderPadding) {
      int maxX = terr.maxX+constructW;
      int minX = terr.maxX;
      terr.constructRight(constructW);
      generateDeco(minX, maxX);
    }
  }

  public void addTree(PVector pos, int layer) {
    int minW = 145;
    // layers[layer].add(new Tree(pos, minW+(int)random(35, 75), (int)random(200, 500)));
  }

  public void addBush(PVector pos, float minSize, float maxSize, int layer) {
    layers[layer].add(new Bush(pos, (int)random(minSize, maxSize), (int)random(minSize, maxSize)));
  }

  public void generateDeco(int minX, int maxX) {
    int w = maxX - minX;
    float step = 1.0 / decoDensity;
    for (float x = minX; x < maxX; x += step) {
      float jitter = random(-step * 0.5, step * 0.5);
      float posX = constrain(x + jitter, minX, maxX);
      world.addTree(new PVector(posX, terr.getHeightAt(posX)), 3);
    }
    for (float x = minX; x < maxX; x += step) {
      float jitter = random(-step * 0.5, step * 0.5);
      float posX = constrain(x + jitter, minX, maxX);
      world.addTree(new PVector(posX, terr.getHeightAt(posX)), 5);
    }

    float bushesEvery = 50;
    for (int i=0; i<w/bushesEvery; i++) {
      float x = minX+i*bushesEvery;
      world.addBush(new PVector(x, terr.getHeightAt(x)), 100, 150, 2);
    }
    
    float bigBushesEvery = 100;
    for (int i=0; i<w/bigBushesEvery; i++) {
      float x = minX+i*bigBushesEvery;
      world.addBush(new PVector(x, terr.getHeightAt(x)), 300, 350, 4);
    }
  }
}
