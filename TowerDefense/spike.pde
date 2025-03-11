class Spike {
 PVector pos;
 boolean removeme= false;
 
 Spike(float x, float y){
  pos = new PVector(x, y); 
 }
 
 void kill(){
  removeme = true; 
 }
 void display(){
   fill(0);
   circle(pos.x, pos.y, 10); 
 }
 
 void check(Enemy e){
   if(circleCircle(e.pos.x, e.pos.y, e.d/2, pos.x, pos.y, 5)){
    e.removeme = true; 
    removeme = true;
   }
 }
  
}
