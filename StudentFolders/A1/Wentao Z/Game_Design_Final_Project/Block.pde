class Block{
  PVector pos;
  int size;
  
  Block(float x, float y){
    pos = new PVector(x,y);
  }
  
  void display(){
    stroke(0, 100, 100);
    fill(0,100,0);
    circle(pos.x, pos.y, 100);
  }
  
}
