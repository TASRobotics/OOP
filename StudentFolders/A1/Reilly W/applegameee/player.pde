class Player{
  PVector player;
 Player(){
   player = new PVector (mouseX, height -100);
 }
 
 void display(){
  fill(255);
  circle(player.x, player.y, 50);
 }
  
  void update(){
   player.x = mouseX;
  }
}
