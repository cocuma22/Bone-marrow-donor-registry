void checkViz() { //<>//
  if (!changeViz) {
    simpleStackedBarGraph(eta, etaUomini, etaDonne, 13);
    percentageSet(0, 37);
  } else {
    interaction(eta);
  }
}

void displayRangeData(int num) {
  if (flag[num]) {
    switch(num) {
    case 0:
      stackedBarGraph(eta, etaUomini, etaDonne, 0, 7);
      percentageSet(0, 7);
      break;
    case 1:
      stackedBarGraph(eta, etaUomini, etaDonne, 8, 17);
      percentageSet(8, 17);
      break;
    case 2:
      stackedBarGraph(eta, etaUomini, etaDonne, 18, 27);
      percentageSet(18, 27);
      break;
    case 3:
      stackedBarGraph(eta, etaUomini, etaDonne, 28, 37);
      percentageSet(28, 37);
    }
  }
}

void simpleStackedBarGraph(int[] eta, int[] uomini, int[] donne, int dim) {
  float posX = 0.0; 
  float posY = height - MARGIN_VER;
  for (int i = 0; i < eta.length; i++) {
    posX = map(eta[i], eta[0], eta[eta.length-1], MARGIN_OR, width - MARGIN_OR - dim);

    //barra uomini
    fill(colors[2]);
    stroke(colors[5]);
    rectMode(CORNER);
    rect(posX, posY, dim, -uomini[i]);

    //barra donne
    fill(colors[3]);
    stroke(colors[5]);
    rect(posX, posY - uomini[i], dim, -donne[i]);
    
    //labels anni
    fill(colors[5]);
    textSize(10);
    textAlign(RIGHT, TOP);
    text(eta[i], posX + 13, posY + 5);
  }
}

void stackedBarGraph(int[]eta, int[] uomini, int[] donne, int min, int max) {
  float posX = 0.0;
  float posY = height - MARGIN_VER;
  float lengthRect = 50;
  int tot = 0;
  int percentage = 0;
  for (int i = min; i <= max; i++) {
    posX = map(eta[i], eta[min], eta[max], MARGIN_OR, width - MARGIN_OR - lengthRect);

    //barra uomini
    fill(colors[2]);
    stroke(colors[5]);
    rectMode(CORNER);
    rect(posX, posY, lengthRect, -uomini[i]);
    percentage = percentage(uomini[i], uomini[i] + donne[i]);
    textSize(15);
    if (i == 0 || i == 37) {
      fill(colors[5]);
      stroke(colors[4]);
      textSize(12);
      if (i == 0) {
        textAlign(RIGHT, BOTTOM);
        text(percentage + "%", posX - 20, posY + 3);
        line(posX - 15, posY - 5, posX + 5, posY - 5);
      } else {
        textAlign(CENTER, BOTTOM);
        text(percentage + "%", posX + lengthRect + 30, posY + 3); 
        line(posX + lengthRect - 5, posY - 5, posX + lengthRect + 15, posY - 5);
      }
    } else {
      fill(colors[4]);
      text(percentage + "%", posX + 10, posY - 30);
    }

    //barra donne
    fill(colors[3]);
    stroke(colors[5]);
    rect(posX, posY - uomini[i], lengthRect, -donne[i]);
    percentage = percentage(donne[i], uomini[i] + donne[i]);
    if (i == 0 || i == 37) {
      fill(colors[5]);
      stroke(colors[4]);
      textSize(12);
      if (i == 0) {
        text(percentage + "%", posX - 20, posY - 10);
        line(posX - 15, posY - 17, posX + 5, posY - 17);
      } else {
        textAlign(CENTER, BOTTOM);
        text(percentage + "%", posX + lengthRect + 30, posY - 15); 
        line(posX + lengthRect - 5, posY - 25, posX + lengthRect + 15, posY - 25);
      }
    } else {
      fill(colors[4]);
      text(percentage + "%", posX + 10, posY - uomini[i] - 30);
    }
    tot = uomini[i] + donne[i];
    labels(lengthRect, posX, posY - tot, tot);

    //labels anni
    fill(colors[5]);
    textSize(20);
    textAlign(LEFT, TOP);
    text(eta[i], posX + 10, posY + 10);
  }
}

void labels(float wRect, float x, float y, int tot) {
  float xPos = x + wRect / 2; 
  float yPos = y - 40;
  if (mouseX > x && mouseX < x + wRect && mouseY > y && mouseY < y + tot) {
    rectMode(CENTER);
    fill(colors[0]);
    rect(xPos, yPos, wRect, 30, 10);
    fill(colors[5]);
    textSize(10);
    textAlign(CENTER, BOTTOM);
    text("TOTAL", xPos, yPos);
    textAlign(CENTER, TOP);
    text(tot, xPos, yPos);
  }
}

void percentageSet(int min, int max) {
  float posX = width / 2;
  float posY = 90;
  int valueU = countTotal(etaUomini, min, max);
  int valueD = countTotal(etaDonne, min, max); 
  int totale = percentage(valueU + valueD, totaleUD);
  int totU = percentage(valueU, totaleUD);
  int totD = percentage(valueD, totaleUD);
  rectMode(CENTER);
  fill(colors[4]);
  stroke(colors[5]);
  rect(posX, posY, 200, 100, 10);
  textSize(20);
  textAlign(CENTER);
  fill(colors[5]);
  if(!changeViz) {
    text("TOTAL REGISTRY", posX, posY - 15);
  } else {
    text(totale + "% OF TOTAL", posX, posY - 15);
  }
  textSize(18);
  fill(colors[2]);
  text("MALES: " + valueU + " (" + totU + "%)", posX, posY + 15);
  fill(colors[3]);
  text("FEMALES: " + valueD + " (" + totD + "%)", posX, posY + 40);
}
