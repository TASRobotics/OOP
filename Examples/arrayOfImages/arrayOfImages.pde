PImage[] pics = new PImage[5];
int i = 0;
void setup(){
  //fullScreen();
  size(800, 600);
  pics[0] = loadImage("mango.png");
  pics[1] = loadImage("cherry.png");
  pics[2] = loadImage("lime.png");
  pics[3] = loadImage("pa.png");
  pics[4] = loadImage("wm.png");
  
  imageMode(CENTER);
}

void draw(){
 background(50); 
 image(pics[i], mouseX, mouseY);
}

void mousePressed(){
  i++;
  if(i > 4){
    i = 0;
  }
}
