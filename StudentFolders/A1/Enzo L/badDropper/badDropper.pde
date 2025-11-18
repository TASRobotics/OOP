player p;
mPlatform m;
//startplatform s;
boolean canJump = false;
ArrayList<mPlatform> platforms = new ArrayList<mPlatform>();
import com.prestopy.mrkeyboard.*;
MrKeyboard k;
void setup() {
  fullScreen();
  p = new player();
  //s = new startplatform();
  k = new MrKeyboard(this);
  platforms.add(new mPlatform(530, 75, 400, 60, 0));
  //for (int i=0; i<10; i=i+1) {
  //  platforms.add(new mPlatform());
  //}
  for(int y = 150; y < 900; y += 70){
    platforms.add(new mPlatform(random(width), y));
  }
}
void draw() {
  background(50);
  p.update();
  p.display();
  //s.display();


  //if (p.contactWith(s)) {
  //  p.vel.y = 0;
  //  p.pos.y = s.pos.y - p.h;
  //  canJump = true;
  //}
  canJump = false;
  for (mPlatform b : platforms) {
    b.update();
    b.display();

    if (p.contactWith2(b)) {
      p.vel.y=0;
      p.pos.y = b.pos.y - p.h;
      canJump = true;
    } else {
    }
  }
  if (k.isKeyDown('A')) {
    p.pos.x=p.pos.x-4;
  }
  if (k.isKeyDown('D')) {
    p.pos.x=p.pos.x+4;
  }
}
void keyPressed() {

  if (key == ' ' && (canJump == true)) {
    p.jump();
    canJump = false;
  }
}
