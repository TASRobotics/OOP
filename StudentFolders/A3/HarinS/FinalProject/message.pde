class Message {
  String message;
  float x, y;
  int duration = 3;
  int created;
  boolean show;

  Message(String s, float x, float y, int d) {
    message = s;
    this.x = x;
    this.y = y;
    duration = d;
    created = millis();
    show = true;
  }

  void display() {
    if (show) {
      if (millis() > created + duration) {
        show = false;
      }
      textAlign(CENTER, CENTER);
      textSize(100);
      text(message, x, y);
    }
  }
}
