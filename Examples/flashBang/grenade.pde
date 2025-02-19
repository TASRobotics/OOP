class Grenade extends Bomb {
  float maxDamage = 40;
  
  Grenade(int x, int y){
    super(x, y);
    c = color(30, 180, 30);
  }
  
  void action(){
    println("poof");
    float d = dist(bx, by, x, y);
    float max = damageRadius + 25;
    float damageToDo = map(d, 0, max, maxDamage, 0);
    if(damageToDo < 1){
      damageToDo = 0;
    }
    playerHealth -= damageToDo;
    
  }
  
}
