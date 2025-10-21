PImage person;
PImage fruit;
int x=400;
int y=300;
float z=0;
 //abc = new PImage[5];
 String[] abc = {"Person.jpg","Fruit.jpg","Clown.jpg","Sword.jpg","Pin.jpg"};
PImage[] images = new PImage[abc.length];
void setup(){
  size(800,600);
  //person= loadImage("Person.jpg");
  //fruit= loadImage("Fruit.jpg");
  //imageMode(CENTER);
for(int i=0; i<abc.length; i++){
  String abc = images[i];
  images[i]= loadImage(abc);
}
  
}
void draw() {
  background(50);
  image(person, x, y, 100, 100);
  image(fruit, mouseX, mouseY, 100, 100);
  
}

void keyPressed(){
  if(key=='d'){
    x=x+5;
  }
  if(key=='a'){
    x=x-5;
  }
  if(key=='w'){
    y=y-5;
  }
  if(key=='s'){
    y=y+5;
  }
  if(key==' '){
    z=random(1,6);
  }
  println(z);
}
