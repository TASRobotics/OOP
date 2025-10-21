PVector start = new PVector(50, 500);
PVector mouse;
PVector bullet = new PVector(50, 500);
PVector bulletVel = new PVector(0, 0);

ArrayList<Bullet> bullets = new ArrayList<Bullet>();

void setup() {
  //fullScreen();
  size(800, 600);
}

void draw() {
  background(45);
  circle(50, 500, 30);
  for (Bullet b : bullets) {
    b.shoot();
  }
  calc();
  if (mousePressed && frameCount % 15 == 0) {
    bullets.add(new Bullet(start, new PVector(bulletVel.x, bulletVel.y)));
  }
  
}
void calc() {
  mouse = new PVector(mouseX, mouseY);
  bullet = new PVector(50, 500);
  PVector difference = PVector.sub(mouse, start);
  println(difference.mag());
  difference.setMag(10);
  println(difference.x + " " + difference.y);
  bulletVel = difference;
}
