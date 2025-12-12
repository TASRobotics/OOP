class Enemy {
  PVector pos;
 PVector vel;
  int size;
  float health;
  boolean dead;
  
  
Enemy(PVector playerPos){
  size = 20;
  pos = new PVector(random(size, 800-size), random(size, 600-size));
  vel = PVector.sub(playerPos, pos);
  vel.normalize();
  vel.mult(2.5); 
  health = 100;
  dead = false;
}


Enemy(PVector bulletpos, int x){
  size = x;
  pos = new PVector(random(size, 800-size), random(size, 600-size));
  vel = PVector.sub(pos, bulletpos);
  vel.normalize();
  vel.mult(2.5); 
  health = 100;
  dead = false;
}

  
  void display(){
    health = health -0.1;
    fill(0,100,health);
    circle(pos.x, pos.y, size);
    if(!dead){
    circle(pos.x, pos.y, size);
    noStroke();
    for (int i = 5; i >= 1; i--) {
      fill(0, 100, health, i*10);  
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
  
  
  void move(){
    pos.add(vel);
  }
  
}
