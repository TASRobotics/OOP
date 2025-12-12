class Regen{
 PVector pos;
 int size;
 boolean heal;
 boolean spawn;
 Regen(){
   pos = new PVector(random(size, width-size), random(size, height-size));
   size = 50;
   heal = false;
   spawn = true;
 }
  
  void display(){
    fill(120,100,100,50);
    square(pos.x, pos.y, size);
  }
  
  void heal(PVector place){
    if(circleRect(place.x, place.y, 25/2, pos.x, pos.y, size, size)==true){
      heal = true;
    }else{
      heal = false;
    }
    
  }
  
  
}
