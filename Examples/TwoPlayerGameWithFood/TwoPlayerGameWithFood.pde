import java.util.HashSet;
HashSet<Integer> keysDown = new HashSet<Integer>();
Player1 p1;
Player2 p2;
Boost b;
Timer t;
Food f;
Reverse r;

void setup() {
  fullScreen();
  //size(800, 800);
  stroke(0);
  strokeWeight(1);
  fill(255, 0, 0);
  f = new Food();
  p1 = new Player1();
  p2 = new Player2();
  b = new Boost();
  r = new Reverse();
  t = new Timer(2000);
  t.pause();
  background(0);
}

void draw() {
  background(0);
  //ellipse(x, y, 100, 100);
  t.update();
  customPress();
  f.show();
  b.show();
  r.show();
  p1.show();
  p2.show();
  
  if(p1.eat(f)){
    p1.score++;
    fill(0);
    ellipse(f.x, f.y, f.s, f.s);
    f.x = random(width);
    f.y = random(height);
  }
  if(p2.eat(f)){
    p2.score++;
    fill(0);
    ellipse(f.x, f.y, f.s, f.s);
    f.x = random(width);
    f.y = random(height);
  }
  
  if(p1.boo(b)){
    p1.boosted = true;
    fill(0);
    ellipse(b.x, b.y, b.s, b.s);
    t.reset();
    t.begin();
    p1.sp = 12;
    b.x = random(width);
    b.y = random(height);
  }
  if(p2.boo(b)){
    p2.boosted = true;
    fill(0);
    ellipse(b.x, b.y, b.s, b.s);
    t.reset();
    t.begin();
    p2.sp = 12;
    b.x = random(width);
    b.y = random(height);
  }
  if(p1.reverseCard(r)){
    p2.rev();
    p1.score++;
    r.counter += random(.2, .8);
  }
  if(p2.reverseCard(r)){
    p1.rev();
    p2.score++;
    r.counter += random(.2, .8);
  }
  if(t.fire){
    p1.sp = 4;
    p2.sp = 4;
    t.pause();
    t.fire = false;
  }
    
}

void customPress() {
  for (Integer k : keysDown) {
    //print(k + " ");
    if (k == 87) { //w
      p1.y -= (p1.sp * p1.dmult);
    } 
    if (k == 83) { //s
      p1.y += (p1.sp * p1.dmult);
    } 
    if (k == 65) { //a
      p1.x -= (p1.sp * p1.dmult);
    } 
    if (k == 68) { //d
      p1.x += (p1.sp * p1.dmult);
    } 
    if (k == 73) { //w
      p2.y -= (p2.sp * p2.dmult);
    } 
    if (k == 75) { //s
      p2.y += (p2.sp * p2.dmult);
    } 
    if (k == 74) { //a
      p2.x -= (p2.sp * p2.dmult);
    } 
    if (k == 76) { //d
      p2.x += (p2.sp * p2.dmult);
    } 
  }
  //println();
}

void keyPressed(KeyEvent e) {
  println(e.getKeyCode());
  keysDown.add(e.getKeyCode());
  if(key == '1'){
    p1.rev();
  }
}

void keyReleased(KeyEvent e) {
  keysDown.remove(e.getKeyCode());
}

boolean keyDown(int kcode) {
  return keysDown.contains(kcode);
}
