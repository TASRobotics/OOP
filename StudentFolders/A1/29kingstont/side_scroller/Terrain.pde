class Terrain {
  private float baseH;
  private int minX;
  private int maxX;

  Terrain(int w) {
    this.baseH = 200;
    this.minX = 0;
    this.maxX = w;
  }
  
  public float getHeightAt(float x) {
    if (x > this.maxX || x < this.minX) return 999;
    
    return height-this.baseH;
  }
  public int getMinX() {
    return this.minX;
  }
  public int getMaxX() {
    return this.maxX;
  }
  
  public void constructLeft(int len) {
    this.minX -= len;
  }
  public void constructRight(int len) {
    this.maxX += len;
  }

  // TODO: take in offset as param and only render till renderPadding
  public void display() {
    fill(72, 50, 27);
    rect(this.minX, height-this.baseH, this.maxX-this.minX, this.baseH);
    
    // cascade layers
    int layers = 5;
    int layerH = 20;
    int dC = 2;
    for (int i=0; i<layers; i++) {
      stroke(0);
      strokeWeight(1);
      fill(Math.max(0, 72-i*dC), Math.max(0, 50-i*dC), Math.max(0, 27-i*dC));
      rect(this.minX, height-this.baseH+(layers-i-1)*layerH, this.maxX-this.minX, layerH);
    }
  }
}
