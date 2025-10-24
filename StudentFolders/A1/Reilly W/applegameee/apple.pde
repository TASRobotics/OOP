class Apple {
  color c;
  ArrayList<Apple> newton = new ArrayList<Apple>();
  PVector apple;
  int s = 0;
  Apple(int col){
    c = col;
    apple = new PVector(random(50, width-50),-50);
  }
  
  void display(){
    if(c == 0){
     fill(255, 0, 0); 
      
    }else{
     fill(0, 255, 0); 
      
    }
    circle(apple.x, apple.y, 50);
    textAlign(RIGHT);
    text("score:" + s, 25, 50);
    
  }
  
  void update(){
   apple.y += 7.5;
  }
  
  void reset(){
   if(apple.y > width - 25){
    apple.y = -50;
    apple.x = random(50, width-50);
    s -= 10;
   }else if(circleCircle(apple.x, apple.y, 25, bullet.x, bullet.y, 25)){
     
     
     
   }
    
  }
}
