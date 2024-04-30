import garciadelcastillo.dashedlines.*; //libreria per disegnare linee tratteggiate
DashedLines dash;

void drawGrill(boolean flag) {
  dash = new DashedLines(this);
  dash.pattern(5, 5);   //indica in pixel le dimensioni dei trattini e dei gap 
  float x = 0.0; 
  float y = MARGIN_VER; 
  float y_start = MARGIN_VER; 
  float y_end = height - MARGIN_VER;
  float y_text = height - MARGIN_VER + 30;

  strokeWeight(1);
  stroke(colors[4]);       //colore griglia
  fill(colors[5]);         //colore testi

  if (!flag) {                                                                  //visualizzazione grafico iscritti totale
    oriz_lines(y, totImmMax, 50, totImmMin, totImmMax, y_end, y_start);         //linee orizzontali
    vertical_lines(x, y_start - 10, y_end + 10, y_text, true);                        //linee verticali
    labels("Number of members", - height / 4, MARGIN_OR / 3);
  } else {                                                                      //visualizzazione grafici uomini e donne
    //grafico basso - uomini
    oriz_lines(y, uominiMax, 36, uominiMin, uominiMax, y_end, height / 2 + 20); 
    vertical_lines(x, height / 2 + 10, y_end + 10, y_text, true);  
    labels("Number of males", - 2 * height / 3 - 20, MARGIN_OR / 3);

    //grafico alto - donne
    oriz_lines(y, donneMax, 55, donneMin, donneMax, height/ 2 - 30, y_start);  
    vertical_lines(x, y_start - 10, height / 2 - 20, height / 2, false);      
    labels("Number of females", - height / 4, MARGIN_OR / 3);
  }
}

void oriz_lines(float y, float forMax, int division, float mapMin, float mapMax, float y_start, float y_end) {
  for (int i = 0; i <= forMax; i++) {
    if (i % division == 0) {
      y = map(i, mapMin, mapMax, y_start, y_end);
      dash.line(MARGIN_OR, y, width - MARGIN_OR/2 + 10, y);
      textAlign(RIGHT, CENTER);
      text(i, MARGIN_OR - 5, y);
    }
  }
}

void vertical_lines(float x, float y_start, float y_end, float y_text, boolean flag) {
  for (int i = annoImmMin; i <= annoImmMax + 1; i++) {
    x = map(i, annoImmMin, annoImmMax, MARGIN_OR, width - MARGIN_OR);
    dash.line(x + 10, y_start, x + 10, y_end);
    if (i % 2 == 0) {
      textSize(14);
      textAlign(CENTER, BOTTOM);
      if(i == 1990 && flag) {
        text(i + "*", x + 10, y_text);
      } else {
        text(i, x + 10, y_text);
      }
    }
  }
}

void labels(String s, float xPos, float yPos) {
  textAlign(LEFT, TOP);
  text("Years", width - MARGIN_OR, height - MARGIN_VER / 2 + 5);
  pushMatrix();
  rotate(-HALF_PI);
  textAlign(LEFT, BOTTOM);
  text(s, xPos, yPos);
  popMatrix();
}
