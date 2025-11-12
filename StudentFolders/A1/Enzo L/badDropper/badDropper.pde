player p;
startplatform s;
mPlatform m;
boolean canJump = false;
ArrayList<mPlatform> platforms = new ArrayList<mPlatform>();
void setup() {
  size(900, 800);
  p = new player();
  s = new startplatform();
  m = new mPlatform();
}
void draw() {
  background(50);
  for (int i=0; i<10; i=i+1) {
    platforms.add(new mPlatform());
  }
  for (int i = platforms.size()-1; i>=0; i--) {
    mPlatform b = platforms.get(i);
    if (platforms.size()>10) {
      platforms.remove(i);
    }
  }
  p.update();
  p.display();
  s.display();
  if (p.contactWith(s)) {
    p.vel.y = 0;
    p.pos.y = s.pos.y - p.h;
  }
  for (mPlatform b : platforms) {
    b.update();
    b.display();
    if (p.contactWith2(b)) {
      p.vel.y=0;
      p.pos.y = m.pos.y - p.h;
    }
  }
  //for (int i = 0; i < platforms.size(); i++) {
  //  mPlatform b = platforms.get(i);
  //  b.update();
  //  b.display();
  //}
}
void keyPressed() {
  if (key == 'a' ) {
    p.pos.x=p.pos.x-5;
  }
  if (key == 'd') {
    p.pos.x=p.pos.x+5;
  }
  if (key == ' ' && (canJump == true)) {
    p.jump();
  }
}
