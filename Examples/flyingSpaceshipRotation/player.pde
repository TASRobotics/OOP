class Player {
  PVector position;
  PVector velocity;
  PVector thrust;
  float angle;
  Naner n;
  ArrayList<Naner> naners = new ArrayList<Naner>();
  

  Player() {
    position = new PVector(400, 300);
    velocity = new PVector(0, 0);
    thrust = new PVector(0, -3);
    angle = 0;
  }
  
  void shootNaner(){
     naners.add(new Naner(position, velocity, angle));
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(radians(angle));
    image(ship, 0, 0);
    popMatrix();
    
    for(Naner n : naners){
      n.display();
      n.update();
    }
  }

  void update() {
    position.add(velocity);
    velocity.mult(0.99);
    velocity.limit(20);
    
    if(position.x > width + 50){
      position.x = -50;
    }
    if(position.x < -50){
      position.x = width + 50;
    }
    if(position.y > height + 50){
      position.y = -50;
    }
    if(position.y < -50){
      position.y = height + 50;
    }
  }

  void forward() {
    velocity.add(thrust);
  }
  void backward() {
    velocity.sub(thrust);
  }
}
