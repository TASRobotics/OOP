
NamePicker mypicker;

void setup(){
  size(800, 600);
  mypicker = new NamePicker("nammes.txt");
}

void draw(){
  background(80);
  mypicker.displayName();
}
  
void keyPressed(){
  if(key == ' '){
    //mypicker.printNames();
    //mypicker.currentIndex = 0;
    //println(mypicker.pickRandomName());
    mypicker.chaChing = true;
  }
}
