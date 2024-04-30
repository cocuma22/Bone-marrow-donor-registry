void drawData() {
  float posX = 125; 
  float posY = height/4 - 50;
  
  for (int i = 0; i < nomi.length; i++) {
    if (i == 4) {
      posX = 125;
      posY = height/2 + 50;
    }

    donutChart(posX, posY, verificaEtaSesso(province.get(i))); //grafico a torta
    drawHole(posX, posY);                                      //cerchio bianco all'interno del grafico a torta
    totali(province.get(i), posX, posY);                       //label totale iscritti per ogni provincia
    labels(posX, posY, nomi[i]);                               //label nomi province
    moreInfo(posX, posY, verificaEtaSesso(province.get(i)));   //informazioni aggiuntive sugli iscritti
    posX += 175;
  }
}

//grafico a  torta 
void donutChart(float xPos, float yPos, int[] etaSesso) {
  float lastAngle = -HALF_PI;
  float somma = 0;
  stroke(colors[3]);
  for (int i = 0; i < etaSesso.length; i++) {
    somma += etaSesso[i];
  }
  for (int i = 0; i < etaSesso.length; i++) {
    float radianti = map(etaSesso[i], 0, somma, 0, 360);
    fill(getColor(i));
    arc(xPos, yPos, 150, 150, lastAngle, lastAngle+radians(radianti));
    lastAngle += radians(radianti);
  }
}

//cerchio bianco all'interno del grafico a torta
void drawHole(float posX, float posY) {
  fill(colors[0]);
  ellipse(posX, posY, 100, 100);
}

//etichette nomi province
void labels(float posX, float posY, String nome) {
  fill(colors[3]);
  textSize(20);
  textAlign(CENTER, CENTER);
  fill(colors[3]);
  text(nome, posX, posY + 100);
}

//informazioni aggiuntive sugli iscritti per ogni provincia
void moreInfo(float posX, float posY, int[] etaSesso) {
  if (isMouseOver(posX, posY)) {
    int totaliDonne = 0;
    int totaliUomini = 0;
    float x = width/2 + 200;
    float y = height - 120; 
    for (int i = 0; i < etaSesso.length; i++) {
      if (i < 4) {
        totaliDonne += etaSesso[i];
      } else {
        totaliUomini += etaSesso[i];
      }
    }
    fill(colors[0]);
    rectMode(CORNER);
    stroke(colors[2]);
    rect(width/2 + 110, height - 130, 190, 120, 7);
    fill(colors[3]);

    //DONNE
    textSize(15);
    text("FEMALES", x - 40, y);
    for (int i = 0; i < 4; i++) {
      fill(getColor(i));
      rectMode(CENTER);
      noStroke();
      rect(x - 50, y + 30, 20, 20);
      textSize(10);
      fill(colors[3]);
      textAlign(LEFT, CENTER);
      text(etaSesso[i], x - 35, y + 28);
      y += 20;
    }

    //UOMINI
    textSize(15);
    x += 15;
    y = height - 120;
    text("MALES", x, y);
    for (int i = 4; i < 8; i++) {
      fill(getColor(i));
      rectMode(CENTER);
      noStroke();
      rect(x + 15, y + 30, 20, 20);
      textSize(10);
      fill(colors[3]);
      textAlign(LEFT, CENTER);
      text(etaSesso[i], x + 30, y + 28);
      y += 20;
    }
  }
}
