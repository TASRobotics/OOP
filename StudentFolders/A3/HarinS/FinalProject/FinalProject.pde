int screen = 0; // Current screen/room (0 = room 0, 1 = room 1, -1 = inventory)
int lastScreen; // Previous screen for inventory toggle

boolean playerHasKeyR = false; // Track if player has collected the red key
boolean playerHasKeyB = false; // Track if player has collected the blue key
boolean playerHasKeyG = false; // Track if player has collected the green key
boolean playerHasKeyY = false; // Track if player has collected the yellow key

  int keyrx = 40;
  int keyry = 40;
  int keyrxs = 15;
  int keyrys = 10;
  
  
import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>(); //
ArrayList<Message> messages = new ArrayList<Message>();

void setup() {
  size(800, 600);
}

void draw() {
  background(50);
  //for loop to show all messages
  for(Message m : messages){
    m.display();
  }
  // Switch between different screens/rooms
  switch(screen) {
  case 0:
    screen0(); // Draw room 0
    break;
  case 1:
    screen1(); // Draw room 1
    break;
  case 2:
    screen2();
    break;
  case -1:
    inventory(); // Draw inventory screen
    break;
  default:
    break;
  }
  
  //leftbutton
  if (screen >= 1){
  fill(255);
  rect(30, 285, 50, 25);
  triangle(20, 300, 50, 350, 50, 250);
  }
  
  //rightbutton
  fill(255);
  rect(720, 285, 50, 25);
  triangle(780, 300, 750, 350, 750, 250);
  
  //customPress(); // Handle player movement
  //if(screen != -1){ // Only draw player if not in inventory
  //  drawPlayer();
  //}
}

//void drawPlayer() {
//  fill(255); // White color for player
//  circle(x, y, 50); // Draw player as white circle
//}





void drawKeyR(){

  fill(255, 0, 0); // Light gray for the blade
  noStroke();
  circle(keyrx, keyry, 50);
  rect(keyrx, keyry - 10, 75, 20);
  rect(keyrx + 40, keyry, 10, 20);
  rect(keyrx + 55, keyry, 10, 20);
  
 
}

void drawKeyB(){
  fill(0, 0, 255); // Light gray for the blade
  rect(40, 10, 20, 60);
}

void drawKeyG(){
  fill(0, 255, 0); // Light gray for the blade
  rect(40, 10, 20, 60);
}

//void customPress() {
//  // Handle continuous key presses for smooth movement
//  for (Integer k : keysDown) {
//    if (k == 87) { // W key - move up
//      y -= speed;
//    }
//    if (k == 68) { // D key - move right
//      x += speed;
//    }
//    if (k == int('S')) { // S key - move down
//      y += speed;
//    }
//    if (k == int('A')) { // A key - move left
//      x -= speed;
//    }
    
//  }
//}

void keyPressed(KeyEvent e) {
  println(e.getKeyCode()); // Debug: print key code
  keysDown.add(e.getKeyCode()); // Add key to pressed keys set
  
  if(key == 'i'){ // Toggle inventory with 'i' key
      if(screen != -1){ // If not in inventory, go to inventory
        lastScreen = screen; // Remember current screen
        screen = -1; // Switch to inventory
      } else { // If in inventory, return to previous screen
        screen = lastScreen; 
      }
    }
  
}

void keyReleased(KeyEvent e) {
  keysDown.remove(e.getKeyCode()); // Remove key from pressed keys set
}

boolean keyDown(int kcode) {
  return keysDown.contains(kcode); // Check if specific key is currently pressed
}

void mousePressed(){
  if(pointRect(mouseX, mouseY, 30, 285, 50, 25) && screen != 0){
    screen -= 1;
  }
  if(pointRect(mouseX, mouseY, 720, 285, 50, 25)){
    screen += 1;
  }
  
  if (screen == 0){
    if (pointRect(mouseX, mouseY, 200, 200, 100, 150)) { 
      if (!playerHasKeyR){
        messages.add(new Message("This door is locked", 400, 500, 1000));
      }
      else if (playerHasKeyR){
        print ("YAY U GOT THE KEY UWU");
      }
    }
    if (pointRect(mouseX, mouseY, 350, 200, 100, 150)) { 
      if (!playerHasKeyG){
        messages.add(new Message("This door is locked", 400, 500, 1000));
      }
      else if (playerHasKeyR){
        print ("YAY U GOT THE KEY UWU");
      }
    }
    if (pointRect(mouseX, mouseY, 500, 200, 100, 150)) { 
      if (!playerHasKeyB){
        messages.add(new Message("This door is locked", 400, 500, 1000));
      }
      else if (playerHasKeyB){
        print ("YAY U GOT THE KEY UWU");
      }
    }
  }
  if (screen == 1 && pointRect(mouseX, mouseY, keyrx - 10, keyry - 10, 100, 40)) {
    playerHasKeyR = true; //player has key red
  }
}
