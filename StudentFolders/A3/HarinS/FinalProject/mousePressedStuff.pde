void memoryGameClickCheck() {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (showc == false && clicked [i][j] == false) {
        if (pointRect(mouseX, mouseY, 110 + 100 * i, 110 + 100 * j, 80, 80)) {
          clicked[i][j] = true;
          colors[i][j] = color(0);
          if (answer[i][j] == color(0, 0, 255)) {
            score++;
          } else {
            mistake--;
          }
        }
      }
    }
  }
}


void doorPressed() {
  if (pointRect(mouseX, mouseY, 200, 200, 100, 150)) {
    if (!playerHasKeyR) {
      messages.add(new Message("This door is locked", 400, 500, 1000));
    } else if (playerHasKeyR) {
      screen = -3;
      reddoor();
    }
  }
  if (pointRect(mouseX, mouseY, 350, 200, 100, 150)) {
    if (!playerHasKeyG) {
      messages.add(new Message("This door is locked", 400, 500, 1000));
    } else if (playerHasKeyR) {
      print ("YAY U GOT THE KEY UWU");
    }
  }
  if (pointRect(mouseX, mouseY, 500, 200, 100, 150)) {
    if (done == false) {
      if (!playerHasKeyB) {
        messages.add(new Message("This door is locked", 400, 500, 1000));
      } else if (playerHasKeyB) {
        screen = -2;
        //bluedoor();
      }
    }
  }
}

void doYouHaveKey() {
  if (screen == 1 && pointRect(mouseX, mouseY, keyrx - 20, keyry - 20, 120, 50)) {
    playerHasKeyR = true; //player has key red
  }
  if (screen == 2 && pointRect(mouseX, mouseY, keybx - 20, keyby - 20, 120, 50)) {
    playerHasKeyB = true; //player has key blue
  }
  if (done == true && pointRect(mouseX, mouseY, keygx - 20, keygy - 20, 120, 50)) {
    playerHasKeyG= true; //player has key green
    screen = 0;
  }
}

void pause(boolean firsttime) {
  if (screen == -3 && !firsttime) {
    stopped = millis();
    stop = true;
    //------
    
    if (redx <= 400 && redx >= 0 && redy <= 300 && redy >= 0 && !redon) {
      redon = true;
    }
    if (redx <= 800 && redx >= 400 && redy <= 300 && redy >= 0 && !yellowon) {
      yellowon = true;
    }
    if (redx <= 400 && redx >= 0 && redy <= 600 && redy >= 300 && !blueon) {
      blueon = true;
    }
    if (redx <= 800 && redx >= 400 && redy <= 600 && redy >= 300 && !greenon) {
      greenon = true;
    }
    
    if (redon && yellowon && greenon && blueon) {
      if (pointRect(mouseX, mouseY, 300, 275, 200, 50)) {
        pieceSetup();
        jigsaw = true;
      }
    }
    if (jigsaw) {
      for (int i = pieces.length - 1; i >= 0; i--) {
        if (pieces[i] != null && pieces[i].over(mouseX, mouseY)) {
          selected = pieces[i];
          selected.startDrag(mouseX, mouseY);
          break;
        }
      }
    }
  }
}
