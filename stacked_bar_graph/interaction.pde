void interaction(int[] eta) {
  float x = width / 2 -100;
  float y = height - MARGIN_VER / 2;
  float wRect = 50;
  float hRect = 30;
  int n1 = 0; 
  int n2 = 7;
  stroke(colors[5]);
  fill(colors[5]);
  textSize(20);
  textAlign(LEFT, TOP);
  text("AGE:", x - 50, y + 5);
  for (int i = 0; i < 4; i++) {
    if (flag[i]) {
      fill(colors[6]);
    } else {
      fill(colors[4]);
    }
    rectMode(CORNER);
    rect(x, y, wRect, hRect);
    fill(colors[5]);
    textSize(13);
    textAlign(LEFT, TOP);
    text(eta[n1] + "~" + eta[n2], x + 5, y + 8);
    n1 = n2 + 1; 
    n2 += 10;
    x += 50;
    chooseGraph(x, y, wRect, hRect, i);
    displayRangeData(i);
  }
}

void chooseGraph (float x, float y, float w, float h, int i) {
  if (mousePressed && mouseX > x - w && mouseX < x && mouseY > y && mouseY < y + h) {
    resetFlag();
    flag[i] = true;
  }
}

void toggleButton(float posX, float posY) { 
  rectMode(CENTER);
  stroke(colors[5]);
  fill(colors[6]);
  strokeWeight(1);
  rect(posX, posY, rWidth, rHeight, 10);
  noStroke();

  if (flagToggle) {
    fill(255);
    ellipse(posX - rWidth / 4, posY, rHeight, rHeight);
  } else {
    fill(255);
    ellipse(posX + rWidth / 4, posY, rHeight, rHeight);
  }
}

void mousePressed() {
  if (mouseX > (st_x - rWidth/2) && mouseX < (st_x + rWidth/2) && mouseY > (st_y - rHeight/2) && mouseY < (st_y + rHeight/2)) {
    changeViz = !changeViz;
    flagToggle = !flagToggle;
  }
}
