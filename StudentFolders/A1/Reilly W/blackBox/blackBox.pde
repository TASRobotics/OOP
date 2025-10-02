void setup() {
 size (800, 600); 
}


void draw() {
 /*if ((mouseX) < (width/2) && (mouseY < height/2)){
   background(255, 0, 0);
 }else if (mouseX < (width/2) && mouseY > height/2 ){
  background (0, 0 , 255); 
 }else if (mouseX> width/2&& mouseY< height /2){
   background (0, 255, 0);
 }else {
  background (0);
 }*/
 
 if (mouseX < (width/3)*2 && (mouseX > (width/3)) && (mouseY < (height/3*2)) && (mouseY> height/3)){
  background (0);
 }else{
  background (255); 
 }
}
