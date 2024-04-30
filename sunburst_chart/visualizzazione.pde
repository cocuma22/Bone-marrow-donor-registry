void disegnaVis() {
  if (!changeViz) {
    //visualizzazione destinazione
    pieChart(destinazione_sesso, italia.size() + estero.size(), coloriSessi, 600); //pieChart esterno
    pieChart(destinazione, italia.size() + estero.size(), coloriDestinazione, 400);//pieChart interno
    testo("ITALY", " donations", destinazione_sesso[0]+destinazione_sesso[1], width/2 + 100, height/2);
    testo("ABROAD", " donations", destinazione_sesso[2]+destinazione_sesso[3], width/2 - 100, height/2 - 50);
    testo("", " males", destinazione_sesso[0], width/2 + 240, height/2 - 100); 
    testo("", " females", destinazione_sesso[1], width/2 - 100, height/2 + 200);
    testo("", " males", destinazione_sesso[2], width/2 - 240, height/2 - 100);
    testo("", " females", destinazione_sesso[3], width/2 - 100, height/2 - 250);
  } else {  
    //visualizzazione modalita donazione
    pieChart(modalita_sesso, creste_iliache.size() + sangue_periferico.size(), coloriSessi, 600);//pieChart esterno
    pieChart(modalita, creste_iliache.size() + sangue_periferico.size(), coloriModalita, 400);   //pieChart interno
    testo("BONE MARROW", " donations", modalita_sesso[0]+modalita_sesso[1], width/2 + 100, height/2);
    testo("PERIPHERAL BLOOD", " donations", modalita_sesso[2]+modalita_sesso[3], width/2 - 100, height/2 - 50);
    testo("", " males", modalita_sesso[0], width/2 + 240, height/2 - 100);
    testo("", " females", modalita_sesso[1], width/2, height/2 + 220);
    testo("", " males", modalita_sesso[2], width/2 - 240, height/2 + 50);
    testo("", " females", modalita_sesso[3], width/2 - 100, height/2 - 250);
  }
}

//grafico a torta
void pieChart(int[] destinazione, int totali, color[] colore, int dimensione) {
  float lastAngle = -HALF_PI;
  stroke(colors[3]);
  for (int i = 0; i < destinazione.length; i++) {
    float radianti = map(destinazione[i], 0, totali, 0, 360);
    fill(colore[i%2]);
    arc(width/2, height/2, dimensione, dimensione, lastAngle, lastAngle + radians(radianti), PIE);
    lastAngle += radians(radianti);
  }
}

void testo(String testo1, String testo2, int quantita, float testoX, float testoY) {
  textSize(18);
  textAlign(CENTER, CENTER);
  fill(colors[3]);
  text(testo1, testoX, testoY);
  text(quantita + testo2, testoX, testoY + 30);
}
