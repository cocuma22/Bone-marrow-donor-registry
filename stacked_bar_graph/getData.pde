void getData() {
  String etaP, sesso; 
  
  //soprannomi colonne
  int colAnnoNascita = 2; 
  int colSesso = 0; 
  
  data = loadTable("ud01.csv", "header"); 
  
  etaU = new IntDict(); //contiene quantità uomini per età
  etaD = new IntDict(); //contiene quantità donne per età
  
  for(int i = 0; i < data.getRowCount(); i++) {
    etaP = findAge(data.getString(i, colAnnoNascita));
    sesso = data.getString(i, colSesso);
    if(sesso.equals("M") ){
      etaU.increment(etaP);
    } else if(sesso.equals("F")) {
      etaD.increment(etaP);
    }
  }
  
  //ordinamento per età
  etaU.sortKeys();
  etaD.sortKeys();
  
  //riempimento array 'eta'
  eta = new int[etaU.size()];      //età di uomini e donne sono uguali
  eta = int(etaU.keyArray());

  //riempimento array 'etaUomini'
  etaUomini = new int[etaU.size()];
  etaUomini = etaU.valueArray();

  //riempimento array 'etaDonne'
  etaDonne = new int[etaD.size()];
  etaDonne = etaD.valueArray();

  etaMin = min(eta);
  etaMax = max(eta);

  uMin = min(etaUomini);
  uMax = max(etaUomini);

  dMin = min(etaDonne);
  dMax = max(etaDonne);
  
  totaleUD = countTotal(etaUomini, 0, etaUomini.length - 1) + countTotal(etaDonne, 0, etaDonne.length - 1);
}