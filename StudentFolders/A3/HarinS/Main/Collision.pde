boolean pointCircle(float px, float py, float cx, float cy, float cr){
  if(dist(px, py, cx, cy) < cr){
    return true;
  } else {
    return false;
  }  
}
