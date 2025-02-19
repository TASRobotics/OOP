int lastGenerate = 0;
int generateEvery = 3000;
int player1score = 0;
int player2score = 0;
char[] player1keys = {'q', 'w', 'e', 'r', 'a', 's', 'd', 'f', 'z', 'x', 'c', 'y'};
char[] player2keys = {'u', 'i', 'o', 'p', 'h', 'j', 'k', 'l', 'b', 'n', 'm', ','};
char player1chosen = ' ';
char player2chosen = ' ';
boolean player1picked = false;
boolean player2picked = false;
int screen = 0;
int scoreToWin = 15000;

void setup() {
  //fullScreen();
  size(800, 600);

  textAlign(CENTER, CENTER);
}

void draw() {
  if (screen == 0) {
    game();
  } else if (screen == 1) {
    gameOver();
  }
}

void keyPressed() {
  if (screen == 0) {
    if (key == player1chosen && player1picked == false) {
      player1score += (lastGenerate + generateEvery) - millis();
      player1picked = true;
    }
    if (key == player2chosen && player2picked == false) {
      player2score += (lastGenerate + generateEvery) - millis();
      player2picked = true;
    }
  }
}

void game() {
  background(50);
  textSize(80);
  if (player1picked) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  text(player1chosen, 200, 300);
  if (player2picked) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  text(player2chosen, 600, 300);
  textSize(40);
  fill(255);
  text(player1score, 200, 50);
  text(player2score, 600, 50);

  if (millis() - lastGenerate >= generateEvery) {
    int randomIndex = (int)random(0, player1keys.length);  
    player1chosen = player1keys[randomIndex];
    player2chosen = player2keys[(int)random(player2keys.length)];
    lastGenerate = millis();
    player1picked = false;
    player2picked = false;
  }
  if (player1score > scoreToWin || player2score > scoreToWin) {
    screen = 1;
  }
}

void gameOver() {
  background(50);
  textSize(80);
  fill(0, 0, 255);
  if (player1score > player2score) {
    text("PLAYER 1 WINS!", 400, 300);
  } else if (player2score > player1score) {
    text("PLAYER 2 WINS!", 400, 300);
  } else {
    text("its a tie?", 400, 300);
  }
}
