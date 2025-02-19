int lastDrawnTime = -99999;
int drawEvery = 500;


void setup(){
  //fullScreen();
  size(800, 600);
}

void draw(){
  if(millis() - lastDrawnTime >= drawEvery){
    circle(random(width), random(height), random(50, 200));
    lastDrawnTime = millis();
  }
}
