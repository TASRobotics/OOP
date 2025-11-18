int MAX_LAYER = 10;

class World {
  private Terrain terr;
  private ArrayList<Platform> platforms;

  private Environment env;
  private float t;
  private float decoDensity = 5/1600f;
  private Layer[] layers = new Layer[MAX_LAYER+1]; // 0 thru 10; 0 is foreground; 10 is background

  private Meeple meeple;
  private ParticleSystem<Dirt> dirtPs;

  private MrKeyboard keyboard;

  World(int worldWidth, MrKeyboard keyboard) {
    this.terr = new Terrain(worldWidth);
    this.platforms = new ArrayList<>();
    this.env = new Environment();
    this.keyboard = keyboard;

    this.dirtPs = new ParticleSystem(new PVector(), (float x, float y, PVector vel, PVector acc) -> new Dirt(new PVector(x, y), vel, acc));

    for (int i=0; i<layers.length; i++) {
      this.layers[i] = new Layer();
    }

    createPlatform(new PVector(500, 500), 200, 50);
  }

  public void attachMeeple(Meeple meeple) {
    this.meeple = meeple;
    
    this.layers[meeple.getLayer()].register(meeple);

    // Register dog
    FlyingDog dog = new FlyingDog(meeple.getPos().copy());
    this.layers[1].register(dog);

    // this.meeple.attachTo(dog.getBody());

    RectBody meepleBody = meeple.getBody();
    dirtPs.attachTo(meeple, new PVector(meepleBody.getW()/2, meepleBody.getH()));
    layers[2].register(dirtPs);
  }

  public int getWorldWidth() {
    return this.terr.maxX - this.terr.minX;
  }

  public void update() {
    long t = System.nanoTime(); // DEBUGGER ########################

    // UPDATE PLAYER
    if (meeple != null) {
      if (this.keyboard.isKeyDown('A')) {
        this.meeple.move(new PVector(-meepleSpeed, 0));
        if (meeple.isGrounded(this.terr, this.platforms)) dirtPs.spawn(2, () -> new PVector(random(2, 5), random(-2, 0)), () -> new PVector());
      }
      if (this.keyboard.isKeyDown('D')) {
        this.meeple.move(new PVector(meepleSpeed, 0));
        if (meeple.isGrounded(this.terr, this.platforms)) dirtPs.spawn(2, () -> new PVector(random(-2, -5), random(-2, 0)), () -> new PVector());
      }
      if (this.keyboard.isKeyDown(' ')) {
        this.meeple.jump(this.terr, this.platforms);
      }
      
      RectBody meepleBody = this.meeple.getBody();
      PVector meeplePos = this.meeple.getPos();
      float meepleW = meepleBody.getW();
      
      if (meeplePos.x+meepleW-offset.x >= width-padding) {
        offset.x += (meeplePos.x+meepleW-offset.x)-(width-padding);
      } else if (meeplePos.x-offset.x <= padding) {
        offset.x -= padding-(meeplePos.x-offset.x);
      }
      
      this.meeple.applyForce(GRAVITY);
      this.meeple.update(world);
    }

    // UPDATE ENTITIES
    for (int i=layers.length-1; i>=0; i--) {
      // UpdateContext ctx = new UpdateContext();
      // ctx.world = this;
      // ctx.terrain = terr;
      // ctx.env = env;
      // ctx.meeple = meeple;

      this.layers[i].update(this);
    }

    this.env.advanceTime();


    logStats("Update", (System.nanoTime() - t)/1e6); // DEBUGGER #######
  }

  void display(PVector offset) {
    long t = System.nanoTime(); // DEBUGGER ########################

    int totalItems = 0;

    this.env.display(offset);

    for (int i=layers.length-1; i>=0; i--) {
      long t2 = System.nanoTime(); // DEBUGGER ########################
      totalItems += this.layers[i].getNumItems();
      this.layers[i].display(offset);
      logStats("Layer "+i, (System.nanoTime() - t2)/1e6);
    }


    this.terr.display();

    

    // Darken based on time
    float dayPercentage = this.env.getDayPercentage();
    float alpha = map(dayPercentage, 0, 1, 255/2, 0);
    fill(0, alpha);
    rect(offset.x, offset.y, width, height);

    logStats("Display", (System.nanoTime() - t)/1e6); // DEBUGGER #######

    fill(0, 255, 0);
    text(totalItems, mouseX+offset.x, mouseY+offset.y);
  }










  public void createPlatform(PVector pos, int w, int h) {
    Platform p = new Platform(pos, w, h);
    layers[0].register(p);
    platforms.add(p);
  }


  // Generate new parts as the meeple moves
  // "Construct world" just sounded cool, but generateWorld prob is better name no
  public void constructWorld(PVector offset) {
    int constructW = width;
    println(constructW);

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
    layers[layer].register(new Bush(pos, (int)random(minSize, maxSize), (int)random(minSize, maxSize)));
  }

  public void generateDeco(int minX, int maxX) {
    int w = maxX - minX;
    float step = 1.0 / decoDensity;
    // for (float x = minX; x < maxX; x += step) {
    //   float jitter = random(-step * 0.5, step * 0.5);
    //   float posX = constrain(x + jitter, minX, maxX);
    //   world.addTree(new PVector(posX, terr.getHeightAt(posX)), 3);
    // }
    // for (float x = minX; x < maxX; x += step) {
    //   float jitter = random(-step * 0.5, step * 0.5);
    //   float posX = constrain(x + jitter, minX, maxX);
    //   world.addTree(new PVector(posX, terr.getHeightAt(posX)), 5);
    // }

    float bushesEvery = 100;
    for (int i=0; i<w/bushesEvery; i++) {
      float x = minX+i*bushesEvery;
      world.addBush(new PVector(x, terr.getHeightAt(x)), 100, 150, 2);
    }
    
    // float bigBushesEvery = 1000;
    // for (int i=0; i<w/bigBushesEvery; i++) {
    //   float x = minX+i*bigBushesEvery;
    //   world.addBush(new PVector(x, terr.getHeightAt(x)), 300, 350, 4);
    // }
  }
}
