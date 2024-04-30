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
