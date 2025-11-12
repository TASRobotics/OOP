
float x = 400;
float y = 575;
float speed = 1.5;
float speed2 =0;
import java.util.HashSet;

color c;

HashSet<Integer> keysDown = new HashSet<Integer>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

boolean canShoot = true;
int lastshot = 0; //when did you last shoot?
int shootEvery = 10;

int lastChanged = 0;
void setup() {
  //fullScreen();
  size(800, 600);
  //b = new Bullet();
  c = color(0);
}

void draw() {
  background(c);
  circle(x, y, 50);
  x = constrain(x, 25, 775);
  customPress();
  
  
  for(Bullet b : bullets){
    b.display();
    b.update();
  }
  if(frameCount >= lastChanged + 60){
    c = color(random(255), random(255), random(255));
    lastChanged = frameCount;
  }
}

void shoot(){
  if (frameCount > shootEvery + lastshot){ //if you shoot at frame 57, wait until after lastShot(57) plus shootEvery (10) [only lets you shoot every 10 frames]
    canShoot = true;
  }
  
  if(canShoot){
    bullets.add(new Bullet(x, y));
    canShoot = false;
    lastshot = frameCount;
  }
}




void customPress() {
  if (keysDown.contains(16)) { //shift
    speed = 6.27;
  } else {
    speed = 1.5;
  }
  for (Integer k : keysDown) {
    if (k == 68) { //d
      x += speed;
    }
    if (k == int('A')) {
      x -= speed;
    }
    if (k == int(' ')) { //check to see if we are allowed to shoot AND the spacebar is pressed
      shoot();
    }
  }
}
void keyPressed(KeyEvent e) {
  println(e.getKeyCode());
  keysDown.add(e.getKeyCode());
}

void keyReleased(KeyEvent e) {
  keysDown.remove(e.getKeyCode());
}

boolean keyDown(int kcode) {
  return keysDown.contains(kcode);
}
