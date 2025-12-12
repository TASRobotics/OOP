boolean circleCircle(float cx1, float cy1, float cd1, float cx2, float cy2, float cd2) {
  // Calculate distance between circle centers
  float distance = dist(cx1, cy1, cx2, cy2);
  // Calculate sum of radii
  float sumOfRadii = (cd1/2) + (cd2/2);
  
  // Check if circles are touching
  if (distance < sumOfRadii) {
    return true;  // Collision detected
  } else {
    return false; // No collision
  }
}
