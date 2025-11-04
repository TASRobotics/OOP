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
    if (x > maxX || x < minX) return 999;
    
    return height-baseH;
  }
  
  public void constructLeft(int len) {
    minX -= len;
  }
  public void constructRight(int len) {
    maxX += len;
  }

  // TODO: take in offset as param and only render till renderPadding
  public void display() {
    fill(72, 50, 27);
    rect(minX, height-baseH, maxX-minX, baseH);
    
    // cascade layers
    int layers = 5;
    int layerH = 20;
    int dC = 2;
    for (int i=0; i<layers; i++) {
      fill(Math.max(0, 72-i*dC), Math.max(0, 50-i*dC), Math.max(0, 27-i*dC));
      rect(minX, height-baseH+(layers-i-1)*layerH, maxX-minX, layerH);
    }
  }
}
