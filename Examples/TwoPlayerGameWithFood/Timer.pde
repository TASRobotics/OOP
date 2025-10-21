class Timer {
  long cm, pm;
  int interval;
  boolean fire = false;
  boolean running = true;
  int difference;
  
  Timer(int i ) {
    interval = i;
    cm = millis();
    pm = cm;
  }
  void pause(){
    running = false;
  }
  
  void begin(){
    running = true;
  }
  
  void changeInterval(int ii){
    interval = ii;
  }
  
  void reset(){
    cm = millis();
    pm = cm;
  }
  
  int getTime(){
    return difference;
  }
  
  void update() {
    if (running) {
      cm = millis();
      difference = int(cm - pm);
      if (difference >= interval) {
        pm = cm;
        fire = true;
      }
    }
  }
}
