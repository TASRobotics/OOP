PImage[] pics = new PImage[5];
int num = 0;

void setup() {
  //fullScreen();
  size(800, 600);
  
  for(int i = 0; i < 5; i++){
    pics[i] = loadImage(i + ".png");
  }

}

void draw() {
  image(pics[num], mouseX, mouseY);
}

void mousePressed() {
  num++;
  if(num >= pics.length){
    num = 0;
  }
}
