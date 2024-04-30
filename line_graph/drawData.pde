void drawData() {
  int[] totAnno;     //array dei totali per anno
  int[] uominiAnno;  //array degli uomini per anno
  int[] donneAnno;   //array delle donne per anno
  int[] anniImm;     //array degli anni di immissione
  float minG = height - MARGIN_VER;
  float maxG = MARGIN_VER;

  //riempimento degli array
  totAnno = new int[annoImmissione.size()];
  totAnno = annoImmissione.valueArray();
  anniImm = new int[annoImmissione.size()];
  anniImm = int(annoImmissione.keyArray());
  uominiAnno = new int[annoImmissione.size()];
  uominiAnno = uomini.valueArray();
  donneAnno = new int[annoImmissione.size()];
  donneAnno = donne.valueArray();

  if (!changeViz) {
    drawLineGraph(totAnno, anniImm, totImmMin, totImmMax, minG, maxG, colors[1]); //totale
  } else {
    maxG = height / 2 + 20;
    drawLineGraph(uominiAnno, anniImm, uominiMin, uominiMax, minG, maxG, colors[2]); //uomini (sotto)
    minG = height / 2 - 30; 
    maxG = MARGIN_VER - 2;
    drawLineGraph(donneAnno, anniImm, donneMin, donneMax, minG, maxG, colors[3]); //donne (sopra)
  }
}

void drawLineGraph(int[] typeAnno, int[] anniImm, int tMin, int tMax, float minG, float maxG, color c) {
  float posX = 0.0;
  float posY = 0.0;
  float prevX = 0.0;
  float prevY = 0.0;
  int diameter = 7;
  for (int i = 0; i < typeAnno.length; i++) {
    posY = map(typeAnno[i], tMin, tMax, minG, maxG);
    posX = map(anniImm[i], annoImmMin, annoImmMax, MARGIN_OR + 10, width - MARGIN_OR + 10);

    if (i == 0) {
      prevX = posX; 
      prevY = posY;
    }
    strokeWeight(3);
    stroke(c);
    fill(c);
    ellipse(posX, posY, diameter, diameter);
    line(prevX, prevY, posX, posY);
    caption(posX, posY, diameter, typeAnno, i);

    prevX = posX; 
    prevY = posY;
  }
  stroke(0);
}

void caption(float posX, float posY, int diameter, int[] totAnno, int value) {
  if (mouseX > (posX - diameter/2) && mouseX < (posX + diameter/2) && mouseY > (posY - diameter/2) 
    && mouseY < (posY + diameter/2)) {
    rectMode(CENTER);
    fill(colors[0]);
    strokeWeight(1);
    rect(posX - 23, posY - 8, 30, 20, 7);
    textAlign(RIGHT, BOTTOM);
    fill(0);
    text(totAnno[value], posX - 10, posY);
    strokeWeight(3);
  }
}
