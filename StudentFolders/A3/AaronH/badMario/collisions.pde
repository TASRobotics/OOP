boolean rectRect(float r1x, float r1y, float r1w, float r1h, float r2x, float r2y, float r2w, float r2h) {
  return r1x + r1w > r2x && r1x < r2x + r2w && r1y + r1h > r2y && r1y < r2y + r2h;
}

boolean pointRect(float px, float py, float rx, float ry, float rw, float rh) {
  return px >= rx && px <= rx + rw && py >= ry && py <= ry + rh;
}

boolean pointCircle(float px, float py, float cx, float cy, float cr) {
  return dist(px, py, cx, cy) < cr;
}

boolean circleCircle(float cx1, float cy1, float cr1, float cx2, float cy2, float cr2) {
  return dist(cx1, cy1, cx2, cy2) < cr1 + cr2;
}
