class Timer {
  int starttime;
  int totaltime;
  boolean done;

  Timer(int total) {
    totaltime = total;
    done = false;
    reset();
  }

  void reset() {
    starttime = millis();
    done = false;
  }

  void update() {
    if (millis() - starttime >= totaltime) {
      done = true;
    }
  }
}
