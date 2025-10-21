Apple a;
Apple b;
Box c;

void setup(){
  size(800, 600);
  a = new Apple(1, random(50, width - 50), -50);
  b = new Apple(0, random(50, width - 50), -50);
  c = new Box();
}

void draw(){
  
  background(255);
  a.display();
  b.display();
  c.display();
  
  //if c is touching a
  //add 1
  
  //if c is touching b
  //subtract 1
  println(yVel);
}
