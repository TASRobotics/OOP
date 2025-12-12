PImage emilyimg;
PImage finalfantasy;
PImage actualstartscreen;
PImage lorescreenbg;
PImage gargoylenobg;
PImage armournobg;
PImage scrollnobg;
PImage gameoverbackground;
PImage rewardscreenforestbg;
PImage bernienobg;
PFont font;

class emilyimg {
  PImage emily;
}
void setup() {
  size(800, 500, P2D);
  surface.setLocation((displayWidth - width) / 2, (displayHeight - height) / 2); // CENTER WINDOW
  starttime = millis();
  font = createFont("myfont.ttf", 15);
  emilyimg = loadImage("emily.png");
  emilyimg.resize(100, 100);
  finalfantasy = loadImage("ffbackground.png");
  actualstartscreen = loadImage("actualstartscreen.png");
  lorescreenbg = loadImage("lorescreenbg.png");
  gargoylenobg = loadImage("gargoylenobg.png");
  armournobg = loadImage("armournobg.png");
  scrollnobg = loadImage("scrollnobg.png");
  gameoverbackground = loadImage("gameoverbackground.jpeg");
  rewardscreenforestbg = loadImage("rewardscreenforestbg.png");
  bernienobg = loadImage("bernienobg.png");
}
