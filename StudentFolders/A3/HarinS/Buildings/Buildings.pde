int i = 0;
int [] y = {200, 400, 300, 500, 250};
int [] x = {50, 200, 350, 500, 650};
int [] w = {100, 80, 120, 120, 100};

void setup() {
  size(800, 600);
  background(30,60,100);
  fill(0);
  for (int i = 0; i <= 4; i++) {
    rect(x[i], 600, w[i], -y[i]);
  }
  
}

void draw() {
  drawBuildingWithWindows(0, 0, 65, 425, 1, 1);
  drawBuildingWithWindows(0, 0, 205, 220, 1, 4);
  drawBuildingWithWindows(0,0, 355, 310, 2, 3);
  drawBuildingWithWindows(0, 0, 505, 110, 2, 7);
  drawBuildingWithWindows(0, 0, 665, 360, 1, 2);

}

void drawBuildingWithWindows(int ix, int iy, int x, int y, int xn, int yn){
  for (ix = 0; ix <= xn; ix++) {
    fill(250,240,140);
    for (iy = 0; iy <= yn; iy++){   
    rect(x + (ix * 40), y + (iy * 70), 30, 50);
    }
  }
}
