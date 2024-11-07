ArrayList<Drop> drops = new ArrayList<Drop>();
ArrayList<Drop2> drops2 = new ArrayList<Drop2>();
color a, b;
color c, d;
void setup() {
  //fullScreen();
  size(800, 600);
  a = color(250, 159, 62); //warm orange
  b = color(242, 143, 229);
  c = color(115, 223, 250); //warm orange
  d = color(123, 237, 188);
}

void draw() {
  fill(60, 10);
  rect(0, 0, width, height);
  for (Drop d : drops) {
    d.uad();
  }
  for (Drop2 d : drops2) {
    d.uad();
  }
}

void mouseDragged() {
  if (mouseButton == RIGHT) {
    drops.add(new Drop());
  } else {
    drops2.add(new Drop2());
  }
}
