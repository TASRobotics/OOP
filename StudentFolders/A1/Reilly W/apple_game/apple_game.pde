Apple a;
Apple b;
Bullet s;
Player x;

void setup(){
  size(800, 600);
  a = new Apple(1, random(50, width - 50), -50);
  b = new Apple(0, random(50, width - 50), -50);
  s = new Bullet();
  x = new Player();
}

void draw(){
  
  background(255);
  
  s.update();
  s.shoot();
  
  
  a.display();
  b.display();
  s.display();
  //x.display();
  
  //if c is touching a
  //add 1
  
  //if c is touching b
  //subtract 1
  //println(yVel);
}
