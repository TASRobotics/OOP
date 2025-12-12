class ED extends Enemy {
  ED(PVector bulletpos, int x){
    super(bulletpos, x);
  }
  
  ED(PVector playerPos){
    super(playerPos);
  }
  
  void update(PVector bpos){
    //PVector temp = new PVector (random(5),random(5)); 
      PVector Edirection = PVector.sub(bpos, pos);
      Edirection.normalize();
      Edirection.rotate(HALF_PI);
      Edirection.mult(4);
      vel = Edirection.copy();
  }
  
  void display(){
    health = health -0.1;
    fill(120,100,100,health);
    circle(pos.x, pos.y, size);
    if(!dead){
    circle(pos.x, pos.y, size);
    noStroke();
    for (int i = 5; i >= 1; i--) {
      fill(120, 100, health, i*10);  
      circle(pos.x, pos.y, size + i * 3);
    }
    }
    if(health <= 0){
      dead = true;
    }
    constrain(health, 0, 100);
    if (pos.x - size/2 < 0 || pos.x + size/2 > width || pos.y - size/2 <0 || pos.y+size/2>height) {
   vel.mult(-1);
  }
  }
  
}
