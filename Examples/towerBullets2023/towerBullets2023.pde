PVector currentpos;
PVector target;

Tower t;
ArrayList<Tower> towers;
ArrayList<Enemy> enemies;
float health = 100;

void setup() {
  //fullScreen();
  size(800, 600);
  currentpos = new PVector(100, 100);
  target = new PVector(500, 500);
  t = new Tower(100, 100);
}

void draw() {
  background(60);
  t.display();
  circle(mouseX, mouseY, 25);
  if (frameCount % 30 == 0 && dist(t.pos.x, t.pos.y, mouseX, mouseY) < 500) {
    t.fire(mouseX, mouseY);
  }

  //for each tower, go through each bullet in the arrayList. for each bullet, go through all enemies.
  //if the bullet and the enemy are touching, subtract from the enemies health and delete the bullet
  //for(Tower t : towers){
  //  for(Bullet b : t.projectiles){
  //    for(Enemy e : enemies){
  //if(circleCircle(e.x, e.y, e.r, b.pos.x, b.pos.y, b.r){

  // }
  //    }
  //  }
  //}
}

void keyPressed() {
}
