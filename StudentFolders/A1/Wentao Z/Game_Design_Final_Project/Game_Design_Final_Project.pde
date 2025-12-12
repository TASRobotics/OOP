PVector mouse;
Bullet b;
Player p;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();
int speed = 5;
ArrayList<Particle> particles = new ArrayList<Particle>();
boolean shake = false;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int spawnrate;
Enemy e;
ArrayList<Enemy> newOnes = new ArrayList<Enemy>();
ArrayList<Bounce> Bouncers = new ArrayList<Bounce>();
ArrayList<EnemyBullet> Ebullets = new ArrayList<EnemyBullet>();
ArrayList<Timer> timers = new ArrayList<Timer>();
ArrayList<ED> eds = new ArrayList<ED>();
ArrayList<HomingBullet> homingbullets = new ArrayList<HomingBullet>();
PVector Edirection;
Block bs;
Grenade g;
Regen r;
ED d;
HomingBullet h;
boolean toggle;
PVector out;
boolean burst = false;
int level;
int counter;
boolean upgrade = false;
float frame;
boolean showupgradetext;
boolean tutorial = true;
boolean gamerunning = false;
boolean startscreen = true;
int tutorialstep = 0;
boolean moved = false;
boolean enemyspawned = false;
boolean enemyDied = false;
boolean EDdied = false;
boolean EDspawned = true;
void setup() {
  //fullScreen();
  size(800, 600);
  p = new Player();
  colorMode(HSB, 360, 100, 100, 100);
  spawnrate = 60;
  toggle = false;
}

void draw() {
  //if (startscreen) {
  //  background(50);
  //  textAlign(CENTER, CENTER);
  //  text("Press Space to Begin", 400, 300);
  //}

  if (tutorial) {
    background(50);
    customPress();
    p.display();
    if (tutorialstep == 0) {
      text("Press WASD to Move", 400, 300);
    }

    if (tutorialstep == 0) {
      text("Press WASD to Move", 400, 300);

      if (!moved) {
        if (keysDown.contains(87) ||keysDown.contains(65) || keysDown.contains(83) || keysDown.contains(68)) {
          moved = true;
          tutorialstep = 1;
        }
      }
    }

    if (tutorialstep==1) {
      text("Press the Left Mouse Button to Shoot", 400, 300);
    }
    if (tutorialstep>=1) {
      for (Bullet b : bullets) {
        b.display();
        b.update();
        b.shoot();
      }
      for (int i = bullets.size() - 1; i >= 0; i--) {
        Bullet b = bullets.get(i);
        b.shoot();
        b.display();
        b.update();


        if (b.explode) {

          for (int j = 0; j < 45; j++) {
            particles.add(new Particle(b.pos.x, b.pos.y, random(30, 45), b.size/1.5));
          }

          bullets.remove(i);
        }
      }


      for (int i = particles.size() - 1; i >= 0; i--) {
        Particle p = particles.get(i);
        p.update();
        p.display();
        if (p.done()) {
          particles.remove(i);
        }
      }
    }

    if (bullets.size() >3 && tutorialstep == 1) {
      tutorialstep ++;
      bullets.clear();
    }

    if (tutorialstep ==2) {

      text("Press Right Click to Shoot a bigger bullet", 400, 300);
    }
    if (bullets.size() >3 && tutorialstep == 2) {
      tutorialstep ++;
    }

    if (tutorialstep == 3) {
      text("Shoot the Enemy", 400, 300);
      for (Enemy e : enemies) {
        e.display();
        e.move();
      }
      for (int i = Ebullets.size() - 1; i >= 0; i--) {
        EnemyBullet b = Ebullets.get(i);
        b.display();
        b.shoot();
        b.update();
        if (b.explode) {
          Ebullets.remove(i);
        }
      }
      if (!enemyspawned) {
        enemies.add(new Enemy(p.pos));
        enemyspawned = true;
      }


      if (frameCount % 60 == 0) {
        for (Enemy e : enemies) {
          PVector Edirection = new PVector(p.pos.x - e.pos.x, p.pos.y - e.pos.y);
          Edirection.normalize();
          Edirection.mult(10);
          Ebullets.add(new EnemyBullet(e.pos.x, e.pos.y, Edirection));
        }
      }



      for (Enemy e : enemies) {
        for (Bullet b : bullets) {
          if (circleCircle(b.pos.x, b.pos.y, b.size/2, e.pos.x, e.pos.y, e.size/2)) {
            e.health = e.health -20;
            b.explode = true;
          }
        }
      }


      for (int i = enemies.size() - 1; i >= 0; i--) {
        Enemy e = enemies.get(i);

        if (e.health <= 0) {
          enemies.remove(i);
          enemyDied = true;
          counter++;
        }
      }

      if (enemyDied) {
        tutorialstep++;
      }
    }
    println(tutorialstep);
    if (tutorialstep == 4) {
      text("Press C for a dash", 400, 300);
      if (keysDown.contains(67)) {
        tutorialstep ++;
      }
    }
    if (tutorialstep == 5) {
      text("Press F for a burst of bullets", 400, 300);
      if (keysDown.contains(70)) {
        tutorialstep ++;
      }
    }
    if (tutorialstep==6) {
      text("Press H for a healing Zone", 400, 300);
      if (keysDown.contains(72)) {
        tutorialstep ++;
      }
    }
    if (tutorialstep>=6) {
      for (Timer t : timers) {
        t.update();
      }

      for (Timer t : timers) {
        if (t.done == true) {
          toggle = false;
          t.reset();
        }
      }

      if (toggle == true) {
        r.heal(p.pos);
        r.display();
        if (r.heal == true) {
          p.health = p.health +1;
        }
      }
    }

    if (tutorialstep == 7) {
      text("Press E for a Shield", 400, 300);
      if (keysDown.contains(69)) {
        tutorialstep++;
      }
    }
    if (tutorialstep == 8) {
      text("Press Q for bouncing Bullets", 400, 300);
      if (keysDown.contains(81)) {
        tutorialstep++;
      }
    }
    if (tutorialstep>=8) {
      for (int i = Bouncers.size() - 1; i >= 0; i--) {
        Bounce b = Bouncers.get(i);
        b.display();
        b.shoot();
        b.update();
        if (b.dead == true) {
          Bouncers.remove(i);
        }
      }
    }
    if (tutorialstep==9) {
      text("Press V for a homing bullet", 400, 300);
      if (keysDown.contains(86)) {
        tutorialstep++;
      }
    }
    if (tutorialstep>=9) {
      for (Enemy e : enemies) {
        for (HomingBullet h : homingbullets) {
          if (circleCircle(h.pos.x, h.pos.y, h.size/2, e.pos.x, e.pos.y, e.size/2)) {
            h.explode = true;
          }
        }
      }
      for (int i = homingbullets.size() -1; i>=0; i--) {
        HomingBullet b = homingbullets.get(i);
        if (b.explode) {

          for (int j = 0; j < 45; j++) {
            particles.add(new Particle(b.pos.x, b.pos.y, random(30, 45), b.size/1.5));
          }

          homingbullets.remove(i);
        }
      }
      for (HomingBullet h : homingbullets) {
        h.display();
        h.shoot();
        h.update();
      }
    }

    if (tutorialstep==10) {
      text("The Green Enemies can dodge your bullets", 400, 300);

      for (ED e : eds) {
        e.display();
        e.move();
      }
      if (!EDspawned) {
        PVector temp = new PVector(random(5), random(5));
        eds.add(new ED(temp));
        enemyspawned = true;
      }
      pushStyle();
      for (ED e : eds) {
        e.display();
        e.move();
      }
      if (eds.size()>0) {
        for (ED e : eds) {
          for (Bullet b : bullets) {
            e.update(b.pos);
          }
        }
      }
      for (ED e : eds) {
        for (Bullet b : bullets) {
          if (circleCircle(b.pos.x, b.pos.y, b.size/2, e.pos.x, e.pos.y, e.size/2)) {
            e.health = e.health -100;
            b.explode = true;
          }
        }
      }
      popStyle();
      for (int i = eds.size() - 1; i >= 0; i--) {
        ED e = eds.get(i);

        if (e.health <= 0) {
          eds.remove(i);
          EDdied = true;
          tutorialstep++;
        }
      }
      text("Tutorial Over", 300, 400);
      tutorialstep++;
    }
   
  }

  if (tutorialstep>=11) {
    gamerunning=true;
    tutorial=false;
    
  }
  
 
  println(tutorialstep);
  if (gamerunning) {
    fill(0, 0, 0, 20);
    rect(0, 0, width, height);
    //background(0,0,0,20);
    //   for(Enemy b : enemies){
    //  textAlign(CENTER, CENTER);
    //  pushStyle();
    //  fill(120,100,100);
    //  text(b.health, b.pos.x, b.pos.y);
    //  popStyle();
    //}
    p.display();
    update();
    customPress();
    push();
    fill(0, 100, 100);
    textAlign(CENTER, CENTER);
    text(p.health, 50, 50);
    pop();
    homing();
  }
}

void mousePressed() {
  if (mouseButton==LEFT) {
    calc();
  }
  if (mouseButton == LEFT && burst == true) {
    int burstSize = 5;
    float spreadAngle = PI/8;
    PVector dir = new PVector(mouseX - p.pos.x, mouseY - p.pos.y);
    dir.normalize();
    for (int i = 0; i < burstSize; i++) {

      float offset = map(i, 0, burstSize - 1, -spreadAngle/2, spreadAngle/2);
      PVector bulletDir = dir.copy();
      bulletDir.rotate(offset);
      bulletDir.mult(5);
      bullets.add(new Bullet(p.pos.x, p.pos.y, bulletDir));
    }
  }
  if (mouseButton==RIGHT) {
    PVector direction = new PVector(mouseX - p.pos.x, mouseY-p.pos.y);
    direction.normalize();
    direction.mult(10);
    bullets.add(new Bullet(p.pos.x, p.pos.y, direction, 50));
    shake = true;
  }
}


void calc() {
  // for(EnemyBullet b : Ebullets){
  //   b.display();
  //   b.shoot();
  //   b.update();
  //   for(Enemy e : enemies){
  //        PVector Edirection = new PVector(p.pos.x - e.pos.x, p.pos.y-e.pos.y);
  //Edirection.normalize();
  //Edirection.mult(10);

  //   }

  // }

  // if(frameCount % 60 ==0){
  //     Ebullets.add(new EnemyBullet(e.pos.x, e.pos.y, Edirection));
  //   }


  PVector direction = new PVector(mouseX - p.pos.x, mouseY-p.pos.y);
  direction.normalize();
  direction.mult(10);
  bullets.add(new Bullet(p.pos.x, p.pos.y, direction));
}

void update() {
  text(level, 400, 300);
  text(counter, 500, 200);
  if (counter % 20 == 0 && counter>0) {
    level = level +1;
  }
  if (counter > 20 && upgrade == false) {
    frame = frameCount;
    upgrade = true;
    showupgradetext = true;
    p.health = 100;
  }
  if (showupgradetext) {
    pushStyle();
    textSize(50);
    textAlign(CENTER, CENTER);
    text("UPGRADE LEVEL"+" "+level, 400, 300);
    textSize(50);
    if (frameCount >= frame + 60) {
      showupgradetext = false;
    }
    popStyle();
  }

  for (Enemy e : enemies) {
    for (Bounce b : Bouncers) {
      if (circleCircle(e.pos.x, e.pos.y, e.size/2, b.pos.x, b.pos.y, b.size/2)==true) {
        e.health = e.health - 100;
      }
    }
  }

  for (ED e : eds) {
    for (Bullet b : bullets) {
      if (circleCircle(b.pos.x, b.pos.y, b.size/2, e.pos.x, e.pos.y, e.size/2)) {
        e.health = e.health -100;
        b.explode = true;
      }
    }
  }

  for (Timer t : timers) {
    t.update();
  }

  for (Timer t : timers) {
    if (t.done == true) {
      toggle = false;
      t.reset();
    }
  }



  for (EnemyBullet b : Ebullets) {
    if (circleCircle(b.pos.x, b.pos.y, b.size/2, p.pos.x, p.pos.y, p.size/2)==true) {
      p.health = p.health -1;
    }
  }
  //println("Enemies:", enemies.size());
  for (int i = Ebullets.size() - 1; i >= 0; i--) {
    EnemyBullet b = Ebullets.get(i);
    b.display();
    b.shoot();
    b.update();
    if (b.explode) {
      Ebullets.remove(i);
    }
  }
  for (Enemy e : enemies) {
    for (HomingBullet h : homingbullets) {
      if (circleCircle(h.pos.x, h.pos.y, h.size/2, e.pos.x, e.pos.y, e.size/2)) {
        h.explode = true;
      }
    }
  }
  for (int i = homingbullets.size() -1; i>=0; i--) {
    HomingBullet b = homingbullets.get(i);
    if (b.explode) {

      for (int j = 0; j < 45; j++) {
        particles.add(new Particle(b.pos.x, b.pos.y, random(30, 45), b.size/1.5));
      }

      homingbullets.remove(i);
    }
  }

  pushStyle();
  if (burst==true) {
    fill(0, 0, 100);
    text("SHOTGUN", 650, 550);
  } else {
    fill(0, 0, 100);
    text("normal", 650, 550);
  }
  popStyle();

  if (toggle == true) {
    r.heal(p.pos);
    r.display();
    if (r.heal == true) {
      p.health = p.health +1;
    }
  }



  if (frameCount % 360 == 0) {
    for (Enemy e : enemies) {
      PVector Edirection = new PVector(p.pos.x - e.pos.x, p.pos.y - e.pos.y);
      Edirection.normalize();
      Edirection.mult(10);
      Ebullets.add(new EnemyBullet(e.pos.x, e.pos.y, Edirection));
    }
  }

  //if(eds.size()>0){
  // for (ED e : eds) {
  //     for(Bullet b : bullets){
  //       PVector temp = new PVector (random(5),random(5));
  //     PVector Edirection = new PVector(b.pos.x - e.pos.x, b.pos.y - b.pos.y);
  //     Edirection.normalize();
  //     Edirection.mult(10);
  //     Edirection.rotate(TWO_PI);
  //  out = temp.copy();
  //     }
  //   }
  //}
  //for(ED e : eds){
  //e.update(out);
  //}
  if (eds.size()>0) {
    for (ED e : eds) {
      for (Bullet b : bullets) {
        e.update(b.pos);
      }
    }
  }


  for (HomingBullet h : homingbullets) {
    h.display();
    h.shoot();
    h.update();
  }


  for (ED e : eds) {
    e.display();
    e.move();
  }

  pushStyle();
  if (frameCount % 360 == 0) {
    PVector temp = new PVector(random(5), random(5));
    eds.add(new ED(temp));
  }
  popStyle();




  p.display();
  //for (int i = enemies.size() - 1; i >= 0; i--) {
  //   Enemy e = enemies.get(i);
  //   e.move();
  //   e.display();
  //   if (e.pos.x < 0 || e.pos.x > width || e.pos.y < 0 || e.pos.y > height) {
  //     enemies.remove(i);
  //   }
  //   PVector Direction = new PVector(e.pos.x - p.pos.x, e.pos.y-p.pos.y);
  // Direction.normalize();
  // Direction.mult(10);
  // if(frameCount % 360 == 0){
  // newOnes.add(new Enemy(Direction));
  // PVector pos = e.pos.copy();
  // PVector d2 = Direction.copy();
  // }
  // }
  // enemies.addAll(newOnes);


  // for (int i = enemies.size() - 1; i >= 0; i--) {
  //  Enemy e = enemies.get(i);
  //  e.move();
  //  e.display();


  //  if (e.pos.x < 0 || e.pos.x > width || e.pos.y < 0 || e.pos.y > height) {
  //    enemies.remove(i);
  //    continue;
  //  }


  //  PVector Direction = PVector.sub(e.pos, p.pos);
  //  Direction.normalize();
  //  Direction.mult(10);

  //  // Spawn new enemy every 360 frames
  //  if (frameCount % 60 == 0) {
  //    PVector pos = e.pos.copy();
  //    PVector vel = Direction.copy();
  //    newOnes.add(new Enemy(Direction));
  //  }
  //}


  //enemies.addAll(newOnes);
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy e = enemies.get(i);
    if (e.dead == true) {
      enemies.remove(e);
      counter = counter +1;
    }
  }

  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy e = enemies.get(i);
    if (enemies.size()>level+5) {
      enemies.remove(e);
    }
  }

  for (Enemy e : enemies) {
    for (Bullet b : bullets) {
      if (circleCircle(b.pos.x, b.pos.y, b.size/2, e.pos.x, e.pos.y, e.size/2)) {
        e.health = e.health -20;
        b.explode = true;
      }
    }
  }

  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy e = enemies.get(i);
    e.move();
    e.display();


    if (e.pos.x < 0 || e.pos.x > width || e.pos.y < 0 || e.pos.y > height) {
      enemies.remove(i);
    }
  }


  if (frameCount % spawnrate == 0) {
    enemies.add(new Enemy(p.pos));
  }


  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.shoot();
    b.display();
    b.update();


    if (b.explode) {

      for (int j = 0; j < 45; j++) {
        particles.add(new Particle(b.pos.x, b.pos.y, random(30, 45), b.size/1.5));
      }

      bullets.remove(i);
    }
  }


  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update();
    p.display();
    if (p.done()) {
      particles.remove(i);
    }
  }

  for (int i = Bouncers.size() - 1; i >= 0; i--) {
    Bounce b = Bouncers.get(i);
    b.display();
    b.shoot();
    b.update();
    if (b.dead == true) {
      Bouncers.remove(i);
    }
  }
}



void customPress() {

  for (Integer k : keysDown) {
    if (k==50) {
      burst = true;
    }

    if (k == 49) {
      burst = false;
    }
    if (k == 87) { //w
      p.pos.y -= speed;
    }
    if (k == 68) { //d
      p.pos.x += speed;
    }
    if (k == int('S')) {
      p.pos.y += speed;
    }
    if (k == int('A')) {
      p.pos.x -= speed;
    }
    if (k==39) {
      calc();
    }
    if (k==81) {
      PVector direction = new PVector(mouseX - p.pos.x, mouseY-p.pos.y);
      direction.normalize();
      direction.mult(10);
      Bouncers.add(new Bounce(p.pos.x, p.pos.y, direction));
    }
    if (k == int('V')) {
    }
    if (k == int('E')) {
      bs = new Block(p.pos.x, p.pos.y);
      bs.display();
      for (int i = Ebullets.size() - 1; i >= 0; i--) {
        EnemyBullet b = Ebullets.get(i);
        if (circleCircle(bs.pos.x, bs.pos.y, 50, b.pos.x, b.pos.y, 5)==true) {
          b.vel.mult(-1);
        }
      }
      for (Enemy e : enemies) {
        if (circleCircle(bs.pos.x, bs.pos.y, 50, e.pos.x, e.pos.y, 10)==true) {
          e.vel.mult(-1);
        }
      }
    }
    if (k == int('R')) {
      p.trails();
      for (int i = enemies.size()-1; i>0; i-- ) {
        Enemy e = enemies.get(i);
        if (polygonCircleIntersect(p.trail, e.pos, e.size/2)) {
          enemies.remove(i);
        }
      }
    }
    if (k==int('F')) {
      //for(int i = 0; i<=360; i=i+60){
      //  //PVector temp = new PVector (i,i);
      //  //temp.normalize();
      //  //temp.mult(10);
      //  PVector temp = PVector.fromAngle(radians(i));
      //  //bullets.add(new Bullet(p.pos.x, p.pos.y));
      //   bullets.add(new Bullet(p.pos.x, p.pos.y, temp));
      //}
      //    float angle1 = frameCount * 10;
      //float angle2 = -frameCount * 10;

      //PVector dir1 = PVector.fromAngle(radians(angle1));
      //PVector dir2 = PVector.fromAngle(radians(angle2));

      //dir1.mult(10);
      //dir2.mult(10);

      //bullets.add(new Bullet(p.pos.x, p.pos.y, dir1));
      //bullets.add(new Bullet(p.pos.x, p.pos.y, dir2));
    }
    if (key=='c') {
      PVector dir = new PVector (mouseX-p.pos.x, mouseY-p.pos.y);
      dir.normalize();
      dir.mult(10);
      p.pos.add(dir);
      for (int i = Ebullets.size() -1; i >=0; i--) {
        EnemyBullet b = Ebullets.get(i);
        Ebullets.remove(i);
      }
      //for(int i = enemies.size() -1; i >=0; i--){
      //  Enemy b = enemies.get(i);
      //  enemies.remove(i);
      //}
    }
    if (key=='x') {
      for (int i=0; i<=360; i=i+360) {
        fill(0, 0, 50);
        circle(p.pos.x, p.pos.y, i);
        for (int j = enemies.size() -1; j >=0; j--) {
          Enemy b = enemies.get(j);
          if (circleCircle(p.pos.x, p.pos.y, i/2, b.pos.x, b.pos.x, b.size/2)==true) {
            enemies.remove(j);
          }
        }
      }
    }
    if (key=='z') {
    }
  }
}
void keyPressed(KeyEvent e) {
  println(e.getKeyCode());
  keysDown.add(e.getKeyCode());
  if (key=='f') {
    for (int i = 0; i<=360; i=i+10) {
      //PVector temp = new PVector (i,i);
      //temp.normalize();
      //temp.mult(10);
      PVector temp = PVector.fromAngle(radians(i));
      temp.mult(10);
      //bullets.add(new Bullet(p.pos.x, p.pos.y));
      bullets.add(new Bullet(p.pos.x, p.pos.y, temp));
    }
  }
  if (key=='z') {
    PVector dir2 = new PVector(mouseX-p.pos.x, mouseY-p.pos.y);
    dir2.normalize();
    dir2.mult(1);
    g = new Grenade(p.pos.x, p.pos.y, dir2);
    g.update();
    for (int j = enemies.size() -1; j >=0; j--) {
      Enemy r = enemies.get(j);
      if (circleCircle(g.pos.x, g.pos.y, g.size/2, r.pos.x, r.pos.y, r.size/2)==true) {
        enemies.remove(j);
      }
    }
  }
  if (key=='h') {
    r = new Regen();
    toggle = true;
    timers.add(new Timer(100000));
  }

  if (key == 'v') {
    PVector direction = new PVector(mouseX - p.pos.x, mouseY-p.pos.y);
    direction.normalize();
    direction.mult(5);
    Enemy target = FindClosestEnemy(p.pos);
    if (target != null) {
      PVector dir = new PVector(0, -1);
      homingbullets.add(new HomingBullet(p.pos.x, p.pos.y, dir, target));
    }
  }

  //if (key == ' ' && gamerunning == false) {
  //  startscreen = false;
  //  tutorial = true;
  //}
}

void homing() {
  for (int i = homingbullets.size() - 1; i >= 0; i--) {
    HomingBullet b = homingbullets.get(i);

    b.update();

    if (b.explode) {
      homingbullets.remove(i);
    }
  }
}
Enemy FindClosestEnemy(PVector from) {
  Enemy closest = null;
  //float closestDist = Float.MAX_VALUE;
  float closestDist = 0;
  for (Enemy e : enemies) {
    float d = PVector.dist(from, e.pos);

    if (d > closestDist) {
      closestDist = d;
      closest = e;
    }
  }
  return closest;
}

void keyReleased(KeyEvent e) {
  keysDown.remove(e.getKeyCode());
}

boolean keyDown(int kcode) {
  return keysDown.contains(kcode);
}
