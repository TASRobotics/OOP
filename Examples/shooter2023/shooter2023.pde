ArrayList<Projectile> bullets = new ArrayList<Projectile>();
ArrayList<Target> enemies = new ArrayList<Target>();
boolean wonthegame = false;
void setup() {
  //fullScreen();
  size(800, 800);
  for (int i = 50; i < 800; i += 100) {
    enemies.add(new Target(50, i));
  }
}

void draw() {
  if (!wonthegame) {
    background(50);
    circle(400, 400, 10);
    println(bullets.size());
    for (Projectile p : bullets) {
      p.uad();
    }
    for (Target t : enemies) {
      t.display();
    }

    for (Projectile p : bullets) {
      for (Target t : enemies) {
        if (circleCircle(p.pos.x, p.pos.y, 5, t.pos.x, t.pos.y, t.d/2) == true) {
          t.health -= 10;
          p.removeme = true;
          if (t.health <= 0) {
            t.removeme = true;
          }
        }
      }
    }



    if (mousePressed && frameCount % 5 == 0) {
      bullets.add(new Projectile(400, 400, mouseX, mouseY));
    }

    for (int i = bullets.size() - 1; i >= 0; i--) {
      Projectile p = bullets.get(i);
      if (p.removeme == true) {
        bullets.remove(p);
      }
    }

    for (int i = enemies.size() - 1; i >= 0; i--) {
      Target t = enemies.get(i);
      if (t.removeme == true) {
        enemies.remove(t);
      }
    }
    if(enemies.size() == 0){
      wonthegame = true;
    }
  } else {
    background(0, 255, 0);
    text("you win", 400, 400);
  }
}

void mousePressed() {
}
