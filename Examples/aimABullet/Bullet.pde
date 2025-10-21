class Bullet {
 PVector loc;
 PVector vel;
 
 Bullet(PVector l, PVector v){
   loc = l.copy();
   vel = v.copy();
 }
 
 void shoot(){
   loc.add(vel);
   circle(loc.x, loc.y, 10);
   
   if(loc.x > width || loc.x < 0){
     vel.x = -vel.x;
   }
      if(loc.y > height || loc.y < 0){
     vel.y = -vel.y;
   }
 }
  
  
}
