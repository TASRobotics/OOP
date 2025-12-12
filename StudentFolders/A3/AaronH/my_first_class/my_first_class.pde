

void setup() {
  size (800, 600);
  pos = new PVector(random(100, 700), random(100, 500));
  vel = new PVector(random(-6, 6), random(-6, 6));
  c= color(#8669DE);
  s=40
}


void draw() {
  fill(c);
  circle(pos.x, pos.y, s);
  pos.x += vel.x;
  pos.y += vel.y;
}

if (pos.x < s/2 || pos.x > width +(s/2) || pos.y < s/2 || pos.y > height + (s/2)) {
  pos = new PVector(random(100, 700), random(100, 500));
  vel = new PVector(random(-6, 6), random(-6, 6));
