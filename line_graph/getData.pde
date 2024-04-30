void getData() {
  String annoImm, sesso; 

  //soprannomi colonne
  int colAnnoImmissione = 1;
  int colSesso = 0;

  data = loadTable("ud01.csv", "header");

  annoImmissione = new IntDict(); //contiene quantità iscritti per anno iscrizione
  uomini = new IntDict();         //contiene quantità uomini divisi per anno iscrizione
  donne = new IntDict();          //contiene quantità donne divise per anno iscrizione

  for (int i = 0; i < data.getRowCount(); i++) {
    annoImm = data.getString(i, colAnnoImmissione);
    annoImmissione.increment(annoImm);    //riempimento dizionario 'annoImmissione'
    sesso = data.getString(i, colSesso);
    switch(sesso) {                       //riempimento dizionari 'uomini' e 'donne'
    case "M":
      uomini.increment(annoImm); 
      break; 
    case "F":
      donne.increment(annoImm);
    }
  }

  totImmMin = min(annoImmissione.valueArray());
  totImmMax = max(annoImmissione.valueArray());
  annoImmMin = min(int(annoImmissione.keyArray()));
  annoImmMax = max(int(annoImmissione.keyArray()));
  uominiMin = min(uomini.valueArray());
  uominiMax = max(uomini.valueArray());
  donneMin = min(donne.valueArray());
  donneMax = max(donne.valueArray()); 
 
  //ordinamento per anno
  annoImmissione.sortKeys(); 
  uomini.sortKeys();
  donne.sortKeys();
}
