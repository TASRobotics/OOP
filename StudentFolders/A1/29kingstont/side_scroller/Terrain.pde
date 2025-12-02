class TerrainSeg {
  private int startX, endX;
  private int height;

  TerrainSeg(int startX, int endX, int height) {
    if (this.endX < this.startX) {
      this.startX = this.endX;
      this.endX = this.startX;
    } else {
      this.startX = startX;
      this.endX = endX;
    }
    
    this.height = height;
  }

  public int getW() {
    return this.endX-this.startX;
  }
  public int getH() {
    return this.height;
  }
  public int getStartX() {
    return this.startX;
  }
  public int getEndX() {
    return this.endX;
  }
}

class Terrain {
  private final int blockSideLen = 40;
  ArrayList<TerrainSeg> segments;
  private int minX;
  private int maxX;

  
  
  private final int baseHAboveGround = blockSideLen*3;
  private final int maxVarianceUp = blockSideLen*5;
  private final int maxVarianceDown = blockSideLen*2;

  private boolean isUpsideDown;

  Terrain(int w, boolean isUpsideDown) {
    this.segments = new ArrayList<>();
    this.isUpsideDown = isUpsideDown;

    this.minX = 0;
    this.maxX = 0;
    this.constructRightWithoutVarying(w);  
  }

  private int getReferencePoint() {
    return this.isUpsideDown ? 0 : height;
  }
  private int getDirection() {
    return this.isUpsideDown ? -1 : 1;
  }
  
  public int getHeightAt(float x) {
    if (x > this.maxX || x < this.minX) return 9999 * this.getDirection();
    
    TerrainSeg targetSegment = null;
    for (TerrainSeg segment : segments) {
      if (segment.startX <= x && segment.endX > x) {
        targetSegment = segment;
      }
    }

    if (targetSegment == null) return 9999 * this.getDirection();
    
    return this.getReferencePoint() - targetSegment.height*this.getDirection();
  }
  public int getHeightAt(RectBody box) {
      int terrY1 = getHeightAt(box.getX());
      int terrY2 = getHeightAt(box.getX()+box.getW());

      return !isUpsideDown ? min(terrY1, terrY2) : max(terrY1, terrY2);
  }

  public int getMinX() {
    return this.minX;
  }
  public int getMaxX() {
    return this.maxX;
  }
  
  public void constructLeft(int len) {
    int riseFactor = int(random(0, 3))-1;
    TerrainSeg lastSeg = segments.size() > 0 ? segments.get(0) : null;
    int lastSegHeight = lastSeg != null ? lastSeg.getH() : this.baseHAboveGround;

    this.segments.add(0, new TerrainSeg(this.minX-len, this.minX, lastSegHeight+riseFactor*this.blockSideLen));
    this.minX -= len;
  }
  public void constructRight(int len) {
    this.construct(len, true);
  }
  public void constructRightWithoutVarying(int len) {
    this.segments.add(new TerrainSeg(this.maxX, this.maxX+len, this.baseHAboveGround));
    this.maxX += len;
  }

  private void construct(int len, boolean isRight) {
    int riseFactor = int(random(0, 3))-1;

    int lastSegIdx = isRight ? segments.size()-1 : 0;
    TerrainSeg lastSeg = (segments.size() > 0) ? segments.get(lastSegIdx) : null;
    int lastSegHeight = (lastSeg != null) ? lastSeg.height : baseHAboveGround;

    int newHAboveGround = lastSegHeight+riseFactor*blockSideLen;
    
    float variance = (newHAboveGround - baseHAboveGround);
    if (variance < 0 && abs(variance) > this.maxVarianceDown) newHAboveGround = this.baseHAboveGround - this.maxVarianceDown;
    else if (variance > 0 && abs(variance) > this.maxVarianceUp) newHAboveGround = this.baseHAboveGround + this.maxVarianceUp;

    int insertIdx = isRight ? segments.size() : 0;

    TerrainSeg newSeg;
    if (isRight) newSeg = new TerrainSeg(this.maxX, this.maxX+len, newHAboveGround);
    else newSeg = new TerrainSeg(this.minX-len, this.minX, newHAboveGround);

    this.segments.add(insertIdx, newSeg);
    this.maxX += len * (isRight ? 1 : -1);
  }

  // TODO: take in offset as param and only render till renderPadding
  public void display(float minX, float maxX) {
    for (TerrainSeg segment : segments) {
      RectBody segmentRect;
      if (!isUpsideDown) {
        segmentRect = new RectBody(new PVector(segment.getStartX(), getHeightAt(segment.getStartX())), segment.getW(), segment.getH());
      } else {
        segmentRect = new RectBody(new PVector(segment.getStartX(), getHeightAt(segment.getStartX())-segment.getH()), segment.getW(), segment.getH());
      }

      if (!segmentRect.isWithin(minX, maxX)) continue;


      PVector boxPos;
      if (!isUpsideDown) boxPos = new PVector(segment.getStartX(), getHeightAt(segment.getStartX()));
      else boxPos = new PVector(segment.getStartX(), 0);

      drawWavyBox2(segmentRect, 10, PLATFORM_BLUE, PLATFORM_BLUE);
    }
  }
}
