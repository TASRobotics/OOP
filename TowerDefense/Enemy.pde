class Enemy {
 PVector pos;
 int targetPoint;
 float speed;
 int HP;
 color c;
 float d;
 boolean removeme = false;
 Enemy(){
   pos = p.points.get(0).copy();
   speed = 13;
   HP = 1;
   c = color(255, 0, 0);
   d = 50;
   targetPoint = 1;
 }
 
 void display(){
   fill(255);
   circle(pos.x, pos.y, d);
 }
 
 void move(){
    PVector target = p.points.get(targetPoint);
    PVector movement = PVector.sub(target, pos);
    movement.setMag(speed);
    pos.add(movement);
    if(pointCircle(target.x, target.y, pos.x, pos.y, speed)){
      pos = target.copy();
      targetPoint++;
    }
    if(targetPoint == p.points.size()){
      reachedEnd();
    }
 }
 void slowDown() {
  speed *= 0.5; // Reduce speed when on Glue
}
 
 void reachedEnd(){
   user.HP--;
   removeme = true;
 }
  
}
