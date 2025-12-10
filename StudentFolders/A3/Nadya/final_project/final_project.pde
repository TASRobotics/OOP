import processing.sound.*;
SoundFile file;

PImage frogImg;
float frogW = 67;
float frogH = 90;
float frogX;
float frogY;
float velocityY = 0; // Frog's vertical speed
float gravity = 0.5; // Gravity effect

Platform[] platforms;
int numPlatforms = 10; // Number of platforms
float spacing = 120; // Vertical spacing between platforms

boolean moveLeft = false; // left movement
boolean moveRight = false; // right movement
boolean jumping = false; // if frog is jumping
boolean gameOver = false; // Game over

int score = 0; // Player's score
int nextObstacleScore = 75; // Score at which obstacles start

ArrayList<Obstacles> obstacles = new ArrayList<Obstacles>(); // ArrayList to hold obstacles

void setup() {
  size(400, 600);
  frogImg = loadImage("froggie-removebg-preview.png");

  platforms = new Platform[numPlatforms];
  for (int i = 0; i < numPlatforms; i++) {
    platforms[i] = new Platform();
    platforms[i].x = random(50, width - 100); // Random horizontal position
    platforms[i].y = height - 150 - i * spacing; // Vertical position based on spacing
    platforms[i].landed = false; // frog hasnt landed on it
  }

  frogX = platforms[0].x + 10; // Start frog above first platform
  frogY = platforms[0].y - frogH;
  file = new SoundFile(this, "doodle jump music.mp3");
  file.loop();
}

void draw() {
  background(#A2ECFF);

  if (!gameOver) {
    velocityY += gravity; // Apply gravity
    frogY += velocityY; // Update frog's vertical position

    if (moveLeft) frogX -= 5; // Move left
    if (moveRight) frogX += 5; // Move right
    // Keep frog inside screen
    if (frogX < 0) {
      frogX = 0;
    } else if (frogX > width - frogW) {
      frogX = width - frogW;
    }

    jumping = true;
  
    for (int i = 0; i < numPlatforms; i++) {
      platforms[i].display();

      // Checking collision with platform
      if (velocityY > 0 &&
        frogX + frogW > platforms[i].x &&
        frogX < platforms[i].x + platforms[i].w &&
        frogY + frogH >= platforms[i].y &&
        frogY + frogH <= platforms[i].y + platforms[i].h) {

        frogY = platforms[i].y - frogH; // Place frog on top of platform
        velocityY = -12; // Bounce up
        jumping = false;

        if (!platforms[i].landed) { // Increase score only once per platform
          score++;
          platforms[i].landed = true;

          // Add obstacle when score reaches threshold
          if (score >= nextObstacleScore) {
            obstacles.add(new Obstacles());
            nextObstacleScore += 5; // Next obstacle after 5 more points
          }
        }
      }

      // Reset platform if it goes off screen
      if (platforms[i].y > height) {
        platforms[i].y = 0;
        platforms[i].x = random(50, width - 100);
        platforms[i].landed = false;
      }
    }

    // Scroll platforms down if frog goes above mid-screen
    if (!gameOver && frogY < height / 2) {
      float diff = height / 2 - frogY;
      frogY = height / 2;

      for (int i = 0; i < numPlatforms; i++) {
        platforms[i].y += diff;
      }
    }
  }

  // Update obstacles
  for (int i = obstacles.size() - 1; i >= 0; i--) {
    Obstacles o = obstacles.get(i);
    o.update(); // Move obstacle down
    o.display(); // Draw obstacle
    if (o.hitsFrog()) gameOver = true; // Check collision
    if (o.y > height) obstacles.remove(i); // Remove if off screen
  }

  image(frogImg, frogX, frogY, frogW, frogH); // Draw frog

  fill(0);
  textSize(20);
  text("Score: " + score, 10, 25); // Display score

  if (frogY > height) {
    gameOver = true;
  }

  if (gameOver) {
    fill(0, 150);
    rect(0, 0, width, height);
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("GAME OVER", width / 2, height / 2 - 20);
    textSize(20);
    text("Score: " + score, width / 2 + 5, height / 2 + 10);
    text("Press R to Restart", width / 2, height / 2 + 40);
  }
}


void keyPressed() {
  if (key == 'a' || keyCode == LEFT) {
    moveLeft = true;
  }
  if (key == 'd' || keyCode == RIGHT) {
    moveRight = true;
  }
  if (key == ' ' && !jumping) {
    velocityY = -12;
    jumping = true;
  }
  if (key == 'r' && gameOver) restartGame();
}

void keyReleased() {
  if (key == 'a' || keyCode == LEFT) {
    moveLeft = false;
  }
  if (key == 'd' || keyCode == RIGHT) {
    moveRight = false;
  }
}

void restartGame() {
  float startY = height - 150;
  for (int i = 0; i < numPlatforms; i++) {
    platforms[i].x = random(50, width - 100);
    platforms[i].y = startY - i * spacing;
    platforms[i].landed = false;
  }
  frogX = platforms[0].x + 10;
  frogY = platforms[0].y - frogH;
  velocityY = 0;
  jumping = false;
  score = 0;
  nextObstacleScore = 75;
  obstacles.clear();
  gameOver = false;
}
