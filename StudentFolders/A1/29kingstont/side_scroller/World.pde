public interface Displayable {
  public void display();
}
public interface HasHealth {
  public float getHealth();
  public float getMaxHealth();
  public float getSacrificialHealth();
  public void damage(float x);
  public void heal(float x);
  public void setHealth(float x);
}
public interface Killable {
  public boolean getIsDead();
}

@FunctionalInterface
public interface Spawner {
  void spawn(PVector pos, boolean isUpsideDown);
}

class World implements Displayable {
  private MrKeyboard keyboard;

  private PVector offset;
  private float viewportPadding = 500;
  private float constructPadding = 100; // Construct the world when viewport is 100 px away from void
  private Layer[] layers = new Layer[Constants.MAX_LAYER+1]; // 0 thru 10; 0 is foreground; 10 is background

  private Terrain rightsideUpTerr;
  private Terrain upsideDownTerr; 
  private Environment env;
  private float decoDensity = 5/1600f;

  private Meeple meeple;
  private ParticleSystem<Dirt> dirtPs;

  private ArrayList<Item> items;
  private int selectedItemIndex;

  private ArrayList<Platform> platforms;
  private ArrayList<Enemy> enemies;
  private ArrayList<Bullet> bullets;
  private ArrayList<ItemEntity> itemEntities;
  
  private Spawner[] spawnableEnemies = {
    (PVector pos, boolean isUpsideDown) -> createEnemy(new BoringZombie(pos, isUpsideDown)),
    (PVector pos, boolean isUpsideDown) -> createEnemy(new Roofus(pos, isUpsideDown)),
    (PVector pos, boolean isUpsideDown) -> createEnemy(new Vestido(pos, isUpsideDown))
  };

  World(int worldWidth, MrKeyboard keyboard) {
    this.keyboard = keyboard;

    this.offset = new PVector();
    this.rightsideUpTerr = new Terrain(worldWidth, false);
    this.upsideDownTerr = new Terrain(worldWidth, true);
    this.env = new Environment();

    this.items = new ArrayList<>();
    this.selectedItemIndex = 0;

    this.platforms = new ArrayList<>();
    this.enemies = new ArrayList<>();
    this.bullets = new ArrayList<>();
    this.itemEntities = new ArrayList<>();

    Constants.CHUNK_W = width/2;

    for (int i=0; i<layers.length; i++) {
      this.layers[i] = new Layer();
    }

    addItem(new Knife());
    createItemEntity(new ItemEntity(new PVector(700, 500), new ShootingThing()));

    createPlatform(new PVector(100, 500), 200, 50);
    createPlatform(new PVector(300, 450), 200, 50);
    createPlatform(new PVector(500, 400), 200, 50);
  }
  
  public Meeple getMeeple() {
    return this.meeple;
  }
  public PVector getOffset() {
    return this.offset;
  }
  public int getWorldWidth() {
    return this.rightsideUpTerr.maxX - this.rightsideUpTerr.minX;
  }

  public ArrayList<Item> getItems() {
    return this.items;
  }
  public int getSelectedItemIndex() {
    return this.selectedItemIndex;
  }
  public int itemCapacityLeft() {
    return Constants.MAX_ITEMS-this.items.size();
  }
  public void addItem(Item item) {
    if (itemCapacityLeft() > 0) {
      this.items.add(item);
    }
  }
  public void setSelectedItem(int i) {
    if (i >= 0 && i < Constants.MAX_ITEMS) {
      Item item = (i < items.size()) ? items.get(i) : null;
      this.meeple.setCurrentlyHeldItem(item);
      this.selectedItemIndex = i;
    }
  }

  public void attachMeeple(Meeple meeple) {
    // Register meeple
    this.meeple = meeple;
    if (!items.isEmpty()) this.meeple.setCurrentlyHeldItem(items.get(this.selectedItemIndex));
    
    this.layers[meeple.getLayer()].register(meeple);


    // Register dirt particle system
    dirtPs = new ParticleSystem(new PVector(), (float x, float y, PVector vel, PVector acc) -> new Dirt(new PVector(x, y), vel, acc));
    RectBody meepleBody = meeple.getBody();
    dirtPs.attachTo(meeple, new PVector(meepleBody.getW()/2, meepleBody.getH()));

    layers[meeple.getLayer()].register(dirtPs);
  }

  private void spawnEnemies(float minX, float maxX) {
    int maxNumEnemiesDay;
    int maxNumEnemiesNight;
    int worldW = rightsideUpTerr.getMaxX();

    if (worldW > Constants.CHUNK_W*10) {
      maxNumEnemiesDay = 5;
      maxNumEnemiesNight = 8;

    } else if (worldW > Constants.CHUNK_W*5) {
      maxNumEnemiesDay = 4;
      maxNumEnemiesNight = 6;
    } else {
      maxNumEnemiesDay = 3;
      maxNumEnemiesNight = 5;
    }

    int numEnemies = int(random(1, maxNumEnemiesDay));
    float dayPercentage = env.getDayPercentage();

    if (dayPercentage < 0.25) {
      numEnemies = int(random(3, maxNumEnemiesNight));
    }

    // Rightside up
    for (int i=0; i<numEnemies; i++) {
      float randX = random(minX, maxX);
      PVector pos = new PVector(randX, rightsideUpTerr.getHeightAt(randX)); // FIXME: yea, this is under the floor, but it snaps up anyways,
                                                                            // and im too lazy to fix it

      int randIdx = int(random(0, spawnableEnemies.length));
      spawnableEnemies[randIdx].spawn(pos, false);
    }

    // Upside down
    for (int i=0; i<numEnemies; i++) {
      float randX = random(minX, maxX);
      PVector pos = new PVector(randX, upsideDownTerr.getHeightAt(randX));
      
      int randIdx = int(random(0, spawnableEnemies.length));
      spawnableEnemies[randIdx].spawn(pos, true);
    }
  }
  private void spawnFlags(float minX, float maxX) {
    if (random(0, 1) >= Constants.FLAG_SPAWN_CHANCE) return;
    boolean isUpsideDown = random(0, 1) < 0.5;

    float x = random(minX, maxX);
    float y = rightsideUpTerr.getHeightAt(x);
    createItemEntity(new ItemEntity(new PVector(x, y-Constants.BLOCK_UNIT), new Flag(), isUpsideDown));
  }

  public void update() {
    long t = System.nanoTime(); // DEBUGGER ########################

    // Receive user input
    long t_receiveInput = System.nanoTime(); // DEBUGGER #####################################
    if (meeple != null) {
      Terrain terrainToUse = getTerrainToUse(meeple.getIsUpsideDown());

      // User input
      if (keyboard.isKeyDown('A')) {
        meeple.move(false);
        if (!Constants.MINIMIZE_GRAPHICS && meeple.isGrounded(terrainToUse, platforms, meeple.getIsUpsideDown())) {
          dirtPs.spawn(2, () -> new PVector(random(2, 5), random(-2, 0)), () -> new PVector());
        }
      }
      if (keyboard.isKeyDown('D')) {
        meeple.move(true);
        if (!Constants.MINIMIZE_GRAPHICS && meeple.isGrounded(terrainToUse, platforms, meeple.getIsUpsideDown())) {
          dirtPs.spawn(2, () -> new PVector(random(-2, -5), random(-2, 0)), () -> new PVector());
        }
      }
      if (keyboard.isKeyTapped(' ')) {
        meeple.jump(terrainToUse, platforms);
      }
      if (keyboard.isKeyDown('j')) {
        meeple.attack(this);
      }

      if (keyboard.isKeyDown('r') && meeple.getCurrentlyHeldItem() instanceof ShootingThing) {
        ShootingThing gun = (ShootingThing) meeple.getCurrentlyHeldItem();
        gun.reload();
      }

      for (int i=0; i<Constants.MAX_ITEMS; i++) {
        if (this.keyboard.isKeyDown((""+(i+1)).charAt(0))) {
          setSelectedItem(i);
        }
      }

      // Debug actions
      if (keyboard.isKeyTapped('h')) {
        meeple.heal(5);
      }
      if (keyboard.isKeyTapped('u')) {
        meeple.flip();
        // if(meeple.getIsUpsideDown()) {
        //   dirtPs.setOffset(new PVector(0, -meeple.getH()));
        // } else {
        //   dirtPs.setOffset(new PVector());
        // }
      }

      // Move viewport
      RectBody meepleBody = meeple.getBody();
      PVector meeplePos = meeple.getPos();
      float meepleW = meepleBody.getW();
      
      if (meeplePos.x+meepleW-offset.x >= width-viewportPadding) {
        offset.x += (meeplePos.x+meepleW-offset.x)-(width-viewportPadding);
      } else if (meeplePos.x-offset.x <= viewportPadding) {
        offset.x -= viewportPadding-(meeplePos.x-offset.x);
      }
    }
    logStats("UPDATE receive user input", (System.nanoTime()-t_receiveInput)/1e6); // DEBUGGER #######

    long t_updateItems = System.nanoTime(); // DEBUGGER #####################################

    // Update items
    for (Item i : items) {
      i.update();
    }
    logStats("UPDATE items", (System.nanoTime()-t_updateItems)/1e6); // DEBUGGER #######

    // Update layers ################################################
    // Get live chunks

    long t_allLayers = System.nanoTime(); // DEBUGGER #####################################

    int startChunk = getChunkIn(offset)[0] - Constants.LIVE_CHUNK_RADIUS;
    int endChunk = getChunkIn(offset)[1] + Constants.LIVE_CHUNK_RADIUS;

    for (int i=layers.length-1; i>=0; i--) {
      layers[i].update(this, startChunk * Constants.CHUNK_W, endChunk * Constants.CHUNK_W);
    }

    logStats("UPDATE all layers", (System.nanoTime()-t_allLayers)/1e6); // DEBUGGER #######
    
    if (meeple != null) {
      // Check if player dropped into void
      if (!meeple.getIsUpsideDown() && meeple.getTop().y >= height+200 || meeple.getIsUpsideDown() && meeple.getBottom().y <= -200) {
        meeple.damage(10);
      }

      // Check for death
      if (meeple.getIsDead()) {
        setGameOver(true);
      }
    }

    // Check if meeple needs to be healed
    for (Enemy e : enemies) {
      if (e.getIsDead() && !e.getIsSuicide()) {
        meeple.heal(e.getSacrificialHealth());

        score += e.getSacrificialHealth()*10;
      }
    }

    // Check for death
    for (int i=items.size()-1; i>=0; i--) {
      if(items.get(i).getIsDead()) {
        items.remove(i);
      }
    }
    for (int i=itemEntities.size()-1; i>=0; i--) {
      if(itemEntities.get(i).getIsDead()) {
        itemEntities.remove(i);
      }
    }
    for (int i=enemies.size()-1; i>=0; i--) {
      if(enemies.get(i).getIsDead()) {
        enemies.remove(i);
      }
    }
    for (int i=bullets.size()-1; i>=0; i--) {
      if(bullets.get(i).getIsDead()) {
        bullets.remove(i);
      }
    }

    long t_envUpdate = System.nanoTime(); // DEBUGGER ################################
    env.update();
    logStats("UPDATE env", (System.nanoTime()-t_allLayers)/1e6); // DEBUGGER #########
    
    long t_glow = System.nanoTime(); // DEBUGGER #####################################
    if (meeple != null) env.glow(meeple.getBody(), 200, offset);
    logStats("UPDATE glow-ify meeple", timeDiffFromNano(t_glow)); // DEBUGGER ####

    logGeneralStats("World update fn", timeDiffFromNano(t)); // DEBUGGER ################################
    logGeneralStats("Chunks generated", (rightsideUpTerr.getMaxX()-rightsideUpTerr.getMinX())/(float) Constants.CHUNK_W);
  }

  public void display() {
    long t = System.nanoTime(); // DEBUGGER ########################

    int startChunk = getChunkIn(offset)[0];
    int endChunk = getChunkIn(offset)[1];

    long t_envBg = System.nanoTime(); // DEBUGGER #####################################
    int totalItems = 0;
    env.displayBackground(offset);
    logStats("DISPLAY env background", timeDiffFromNano(t_envBg)); // DEBUGGER ###############


    long t_layers = System.nanoTime();
    for (int i=layers.length-1; i>=0; i--) {
      totalItems += layers[i].getNumItems();
      layers[i].display(startChunk * Constants.CHUNK_W, endChunk * Constants.CHUNK_W);
    }
    logStats("DISPLAY all layers", timeDiffFromNano(t_layers));


    long t_terrs = System.nanoTime();
    rightsideUpTerr.display(startChunk * Constants.CHUNK_W, endChunk * Constants.CHUNK_W);
    upsideDownTerr.display(startChunk * Constants.CHUNK_W, endChunk * Constants.CHUNK_W);
    logStats("DISPLAY terrain", timeDiffFromNano(t_terrs));


    long t_darknessFilter = System.nanoTime();
    env.displayFilter(offset);
    logStats("DISPLAY darkness filter", timeDiffFromNano(t_darknessFilter)); // DEBUGGER #######
    

    logGeneralStats("World display fn", timeDiffFromNano(t)); // DEBUGGER #######
    logGeneralStats("# registered objects", totalItems);
  }

  private int[] getChunkIn(PVector offset) {
    int startChunk = floor(offset.x / Constants.CHUNK_W);
    int endChunk = ceil((offset.x+width) / Constants.CHUNK_W);

    return new int[]{startChunk, endChunk};
  }
  public Terrain getTerrainToUse(boolean isUpsideDown) {
    return isUpsideDown ? upsideDownTerr : rightsideUpTerr;
  }









  public void createPlatform(PVector pos, int w, int h) {
    Platform p = new Platform(pos, w, h);
    layers[2].register(p);
    platforms.add(p);
  }
  public void createTrampoline(PVector pos, int w, int h) {
    Trampoline t = new Trampoline(pos, w, h);
    layers[2].register(t);
    platforms.add(t);
  }
  public void createEnemy(Enemy e) {
    if (!Constants.SPAWN_ENEMIES) return;

    layers[2].register(e);
    enemies.add(e);
  }
  public void createBullet(Bullet b) {
    layers[2].register(b);
    bullets.add(b);
  }
  public void createItemEntity(ItemEntity e) {
    layers[2].register(e);
    itemEntities.add(e);
  }


  // Generate more world as the meeple moves
  // "Construct world" just sounded cool, but generateWorld prob is better name no
  public void constructWorld() {
    // if (offset.x <= rightsideUpTerr.minX + constructPadding) {
    //   int maxX = rightsideUpTerr.minX;
    //   int minX = rightsideUpTerr.minX-constructW;
    //   this.rightsideUpTerr.constructLeft(constructW);
    //   this.upsideDownTerr.constructLeft(constructW);
    //   this.generateDeco(minX, maxX);

    //   this.spawnEnemies(minX, maxX);
    // }

    // Construct right
    if (offset.x+width >= rightsideUpTerr.maxX - constructPadding) {
      int maxX = rightsideUpTerr.maxX + Constants.CHUNK_W;
      int minX = rightsideUpTerr.maxX;
      rightsideUpTerr.constructRight(Constants.CHUNK_W);
      upsideDownTerr.constructRight(Constants.CHUNK_W);
      generateDeco(minX, maxX);

      spawnEnemies(minX, maxX);
      spawnFlags(minX, maxX);


      if (random(0, 1) < Constants.TRAMPOLINE_SPAWN_CHANCE) {
        println("Spawned trampoline");

        float x = random(minX, maxX);
        if (random(0, 1) < 0.5) {
          float terrY = rightsideUpTerr.getHeightAt(x);
          createTrampoline(new PVector(x, terrY - Constants.TRAMPOLINE_H), Constants.TRAMPOLINE_W, Constants.TRAMPOLINE_H); // Rightside up
        } else {
          float terrY = upsideDownTerr.getHeightAt(x);
          createTrampoline(new PVector(x, terrY), Constants.TRAMPOLINE_W, Constants.TRAMPOLINE_H); // Upside down
        }
      }

      score += 50; // score variable from side_scroller.pde
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
    //   world.addTree(new PVector(posX, rightsideUpTerr.getHeightAt(posX)), 3);
    // }
    // for (float x = minX; x < maxX; x += step) {
    //   float jitter = random(-step * 0.5, step * 0.5);
    //   float posX = constrain(x + jitter, minX, maxX);
    //   world.addTree(new PVector(posX, rightsideUpTerr.getHeightAt(posX)), 5);
    // }

    float bushesEvery = 100;
    for (int i=0; i<w/bushesEvery; i++) {
      float x = minX+i*bushesEvery;
      this.addBush(new PVector(x, rightsideUpTerr.getHeightAt(x)), 100, 150, 2);
    }
    
    // float bigBushesEvery = 1000;
    // for (int i=0; i<w/bigBushesEvery; i++) {
    //   float x = minX+i*bigBushesEvery;
    //   world.addBush(new PVector(x, rightsideUpTerr.getHeightAt(x)), 300, 350, 4);
    // }
  }
}
