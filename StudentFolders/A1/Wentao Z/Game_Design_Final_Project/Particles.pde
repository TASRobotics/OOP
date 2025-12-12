class Particle {
  PVector pos, vel;
  float hue, life, size, angle;

  Particle(float x, float y, float h) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.mult(random(10, 20));      
    hue = h;
    life = 100;
    size = random(6, 16);        
    angle = random(TWO_PI);      
  }
  
   Particle(float x, float y, float h, float s) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.mult(random(10, 20));      
    hue = h;
    life = 100;
    size = s;       
    angle = random(TWO_PI);      
  }

  void update() {
    pos.add(vel);
    vel.mult(0.9);               
    life -= 2;                   
    angle += 0.1;               
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    fill(hue, 100, 100, life*2);
    drawTriangle(size);
    popMatrix();
  }

  void drawTriangle(float s) {
    beginShape();
    vertex(-s/2, s/2);
    vertex(0, -s/2);
    vertex(s/2, s/2);
    endShape(CLOSE);
  }

  boolean done() {
    return life <= 0;
  }
}
