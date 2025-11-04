class Bush extends Static {
  Bush(PVector pos, int w, int h) {
    super(pos, w, h);
  }
  
  protected void renderCache() {
    float cW = cachedRender.width;
    float cH = cachedRender.height;
    
    cachedRender.beginDraw();
    cachedRender.fill(8, 107, 57, 255/2);
    cachedRender.ellipse(cW/2,cH, cW, cH);
    cachedRender.endDraw();
  }
}
