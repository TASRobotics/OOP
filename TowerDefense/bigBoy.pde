class BigBoy extends Enemy {
 BigBoy(){
  super();
  c = color(255, 0, 0);
  d = 100;
  HP = 5;
 }
 
 void reachedEnd(){
   user.HP-= 4;
   removeme = true;
 }
  
}
