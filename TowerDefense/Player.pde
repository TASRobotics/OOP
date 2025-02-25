class Player {
 int HP;
 
 Player(){
   HP = 100;
 }
 
 void drawHealth(){
   textSize(50);
   text(HP, 50, 50);
 }
 
 void checkGameOver(){
  if(HP <= 0){
   screen = "gameOver"; 
  }
 }
  
}
