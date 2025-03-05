class Spike {
 PVector p;
 boolean removeme= false;
 
 Spike(float x, float y){
  p = new PVector(x, y); 
 }
 
 void display(){
   fill(0);
   circle(p.x, p.y, 10); 
 }
 
 void check(Enemy e){
   if(circleCircle(e.pos.x, e.pos.y, e.d/2, p.x, p.y, 5)){
    e.removeme = true; 
    removeme = true;
   }
 }
  
}
