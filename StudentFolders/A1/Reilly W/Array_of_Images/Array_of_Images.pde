PImage img;
PImage img2;
PImage[] pics = new PImage[5];
int x = 0;
void setup() {
  size(800, 600);
  img = loadImage("jett.5.png");
  img2 = loadImage("reyna.5.png");
  pics[2] =loadImage("yoru.png");

  imageMode(CENTER);
}

void draw() {
  /*background(50);*/
  image(img, mouseX - 150, mouseY);
  image(img2, mouseX +150, mouseY);
  println(x);
}


void keyPressed() {
  if (key == ' ') {
    x = int(random(10, 100)) ;
    println(x);
  }
}
