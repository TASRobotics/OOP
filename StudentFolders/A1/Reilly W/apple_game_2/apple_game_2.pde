Apple a;
Apple b;
Bullet g;
Bullet r;
Player x;

void setup() {
  size(800, 600);
  a = new Apple(1, random(50, width - 50), -50);
  b = new Apple(0, random(50, width - 50), -50);
}

void draw() {
  background(200);
  a.display();
  b.display();
}
