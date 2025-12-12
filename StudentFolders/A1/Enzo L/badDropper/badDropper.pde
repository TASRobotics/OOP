player p;
mPlatform m;
//startplatform s;
ArrayList<mPlatform> platforms = new ArrayList<mPlatform>();
import com.prestopy.mrkeyboard.*;
MrKeyboard k;
boolean onPlatform= false;
long starttime;
float totaltime;
void setup() {
  fullScreen();
  p = new player();
  //s = new startplatform();
  m = new mPlatform();
  k = new MrKeyboard(this);
  platforms.add(new mPlatform(400, 75, 700, 20, 0));
  //for (int i=0; i<10; i=i+1) {
  //  platforms.add(new mPlatform());
  //}
  for (int y = 150; y < 900; y += 45) {
    platforms.add(new mPlatform(random(50,850), y));
  }
}
void draw() {
  onPlatform = false;
  millis();
  background(50);
  p.display();
  p.update();
  //s.display();
  for (mPlatform b : platforms) {
    b.update();
    b.display();
    if (p.contactWithTop(b)) {
      p.vel.y=0;
      p.pos.y = b.pos.y - p.h;
      p.canJump = true;
      onPlatform = true;
      if (starttime == 0) {
        starttime = millis();
      }
    }
    if(p.contactWithSides(b)){
      p.gameover = true;
    }
  }
  if (onPlatform) {
    totaltime = (millis() - starttime) /1000.0;
    if (totaltime > 4){
      p.pos.y +=30;
    }
  }else{
    starttime = 0;
    totaltime = 0;
  }
  println(totaltime);
  text("Time On Platforms:" +totaltime,50,100); 
  textSize(70);
  if (p.pos.x > width + 25 || p.pos.x < 0 - 25 || p.pos.y < 0 - 25) {
    p.gameover = true;
  }
  if (p.pos.y > height + 1) {
    p.gamewon = true;
  }
  if (k.isKeyDown('A')) {
    p.pos.x=p.pos.x-4;
  }
  if (k.isKeyDown('D')) {
    p.pos.x=p.pos.x+4;
  }
  gameWon();
  gameOver();
}

void keyPressed() {
  if (key == ' ' && (p.canJump == true)) {
    p.jump();
    p.canJump = false;
  }
}
void gameOver() {
  if (p.gameover == true) {
    background(145, 15, 15);
    textAlign(CENTER, CENTER);
    text("GAMEOVER", width/2, height/2);
    textSize(200);
    fill(0, 0, 0);
  }
}
void gameWon() {
  if (p.gamewon == true) {
    background(0, 200, 0);
    textAlign(CENTER, CENTER);
    text("YOU WON", width/2, height /2);
    textSize(200);
    fill(0, 0, 0);
  }
}
