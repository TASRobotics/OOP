int MAX_LAYER = 10;

class World {
  private MrKeyboard keyboard;

  private PVector offset;
  private float viewportPadding = 500;
  private float constructPadding = 100; // Construct the world when viewport is 100 px away from void
  private Layer[] layers = new Layer[MAX_LAYER+1]; // 0 thru 10; 0 is foreground; 10 is background

  private Terrain terr;
  private Environment env;
  private float decoDensity = 5/1600f;

  private Meeple meeple;
  private ParticleSystem<Dirt> dirtPs;

  private ArrayList<Item> items;
  private ArrayList<Platform> platforms;
  private ArrayList<Enemy> enemies;
  private ArrayList<Bullet> bullets;

  World(int worldWidth, MrKeyboard keyboard) {
    this.keyboard = keyboard;

    this.offset = new PVector();
    this.terr = new Terrain(worldWidth);
    this.env = new Environment();

    this.items = new ArrayList<>();
    this.platforms = new ArrayList<>();
    this.enemies = new ArrayList<>();
    this.bullets = new ArrayList<>();

    for (int i=0; i<layers.length; i++) {
      this.layers[i] = new Layer();
    }

    this.items.add(new Knife());

    createPlatform(new PVector(100, 500), 200, 50);
    createPlatform(new PVector(300, 450), 200, 50);
    createPlatform(new PVector(500, 400), 200, 50);

    createEnemy(new Roofus(new PVector(500, 500)));
    createEnemy(new Roofus(new PVector(900, 500)));
  }
  
  public Meeple getMeeple() {
    return this.meeple;
  }
  public PVector getOffset() {
    return this.offset;
  }

  public void attachMeeple(Meeple meeple) {
    // Register meeple
    this.meeple = meeple;
    if (!items.isEmpty()) this.meeple.setCurrentlyHeld(items.get(0));
    
    this.layers[meeple.getLayer()].register(meeple);


    // Register dirt particle system
    this.dirtPs = new ParticleSystem(new PVector(), (float x, float y, PVector vel, PVector acc) -> new Dirt(new PVector(x, y), vel, acc));
    RectBody meepleBody = meeple.getBody();
    dirtPs.attachTo(meeple, new PVector(meepleBody.getW()/2, meepleBody.getH()));

    this.layers[meeple.getLayer()].register(dirtPs);
  }

  public int getWorldWidth() {
    return this.terr.maxX - this.terr.minX;
  }

  public void update() {
    long t = System.nanoTime(); // DEBUGGER ########################

    // Update meeple
    if (meeple != null) {
      // User input
      if (this.keyboard.isKeyDown('A')) {
        this.meeple.move(false);
        if (meeple.isGrounded(this.terr)) dirtPs.spawn(2, () -> new PVector(random(2, 5), random(-2, 0)), () -> new PVector());
      }
      if (this.keyboard.isKeyDown('D')) {
        this.meeple.move(true);
        if (meeple.isGrounded(this.terr)) dirtPs.spawn(2, () -> new PVector(random(-2, -5), random(-2, 0)), () -> new PVector());
      }
      if (this.keyboard.isKeyDown(' ')) {
        this.meeple.jump(this.terr, this.platforms);
      }
      if (this.keyboard.isKeyDown('j')) {
        this.meeple.attack(this);
      }

      // DEBUGGING
      if (this.keyboard.isKeyTapped('h')) {
        this.meeple.heal(5);
      }

      // Move viewport
      RectBody meepleBody = this.meeple.getBody();
      PVector meeplePos = this.meeple.getPos();
      float meepleW = meepleBody.getW();
      
      if (meeplePos.x+meepleW-offset.x >= width-viewportPadding) {
        offset.x += (meeplePos.x+meepleW-offset.x)-(width-viewportPadding);
      } else if (meeplePos.x-offset.x <= viewportPadding) {
        offset.x -= viewportPadding-(meeplePos.x-offset.x);
      }
    }

    // Update entities
    for (int i=enemies.size()-1; i>=0; i--) {
      if(this.enemies.get(i).isDead()) {
        this.enemies.remove(i);
      }
    }

    // Update layers
    for (int i=layers.length-1; i>=0; i--) {
      this.layers[i].applyForce(GRAVITY);
      this.layers[i].update(this);
    }

    // Check for death
    if (this.meeple.isDead()) {
      setGameOver(true);
    }

    this.env.advanceTime();

    logStats("Update", (System.nanoTime() - t)/1e6); // DEBUGGER #######
  }

  void display() {
    long t = System.nanoTime(); // DEBUGGER ########################

    int totalItems = 0;

    this.env.display(offset);

    for (int i=layers.length-1; i>=0; i--) {
      totalItems += this.layers[i].getNumItems();
      this.layers[i].display(offset);
    }

    this.terr.display();

    // Darken based on time
    float dayPercentage = this.env.getDayPercentage();
    float alpha = map(dayPercentage, 0, 1, 255/2, 0);
    fill(0, alpha);
    rect(offset.x, offset.y, width, height);

    logStats("Display", (System.nanoTime() - t)/1e6); // DEBUGGER #######

    // fill(0, 255, 0);
    // text(totalItems, mouseX+offset.x, mouseY+offset.y);
  }










  public void createPlatform(PVector pos, int w, int h) {
    Platform p = new Platform(pos, w, h);
    this.layers[2].register(p);
    this.platforms.add(p);
  }
  public void createEnemy(Enemy e) {
    this.layers[2].register(e);
    this.enemies.add(e);
  }
  public void createBullet(Bullet b) {
    this.layers[2].register(b);
    this.bullets.add(b);
  }


  // Generate more world as the meeple moves
  // "Construct world" just sounded cool, but generateWorld prob is better name no
  public void constructWorld() {
    int constructW = width;

    if (offset.x <= terr.minX + constructPadding) {
      int maxX = terr.minX;
      int minX = terr.minX-constructW;
      this.terr.constructLeft(constructW);
      this.generateDeco(minX, maxX);
    }
    if (offset.x+width >= terr.maxX - constructPadding) {
      int maxX = terr.maxX+constructW;
      int minX = terr.maxX;
      this.terr.constructRight(constructW);
      this.generateDeco(minX, maxX);
    }
  }

  public void addTree(PVector pos, int layer) {
    int minW = 145;
    // layers[layer].add(new Tree(pos, minW+(int)random(35, 75), (int)random(200, 500)));
  }

  public void addBush(PVector pos, float minSize, float maxSize, int layer) {
    this.layers[layer].register(new Bush(pos, (int)random(minSize, maxSize), (int)random(minSize, maxSize)));
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
      this.addBush(new PVector(x, terr.getHeightAt(x)), 100, 150, 2);
    }
    
    // float bigBushesEvery = 1000;
    // for (int i=0; i<w/bigBushesEvery; i++) {
    //   float x = minX+i*bigBushesEvery;
    //   world.addBush(new PVector(x, terr.getHeightAt(x)), 300, 350, 4);
    // }
  }
}
