//dato l'anno di nascita, ritorna l'età corrispondente
int trovaEta(int annoNascita) {
  return 2017 - annoNascita;
}

//controlla se il mouse è sopra un grafico a torta
boolean isMouseOver(float posX, float posY) {
  if (mouseX > posX - 150/2 && mouseX < posX + 150/2 && 
    mouseY > posY - 150/2 && mouseY < posY + 150/2) { //150 è il diametro del donutChart
    return true;
  }
  return false;
}

//ritorna il colore corretto (contiene le varie saturazioni di rosa e blu)
color getColor(int i) {
  //colori utilizzati
  color[] colors = {
    #FD367E, //[0] donne 18-25
    #FD689E, //[1] donne 26-35
    #FD9ABE, //[2] donne 36-45
    #FDCDDE, //[3] donne 46-55
    #1934E5, //[4] uomini 18-25
    #475CE5, //[5] uomini 26-35
    #7584E5, //[6] uomini 36-45
    #A3ACE5, //[7] uomini 46-55
  };

  switch(i) {
  case 0:
    return colors[0];
  case 1:
    return colors[1];
  case 2:
    return colors[2];
  case 3: 
    return colors[3];
  case 4: 
    return colors[4];
  case 5: 
    return colors[5];
  case 6: 
    return colors[6];
  case 7: 
    return colors[7];
  default:
    return #000000;
  }
}

//data una provincia, calcola il totale dei suoi iscritti
void totali(ArrayList<Iscritto> provincia, float x, float y) {
  fill(colors[3]);
  textSize(20);
  textAlign(CENTER);
  text(provincia.size(), x, y);
  textSize(15);
  text("Members", x, y + 20);
}

//ritorna array contenente le quantità di donne e poi di uomini per ogni fascia di età dalla minore alla maggiore 
int[] verificaEtaSesso(ArrayList<Iscritto> provincia) {
  IntDict etaSesso = new IntDict();
  String fascia = "";
  
  for (int i = 0; i < provincia.size(); i++) {   
    fascia = fasciaEta(provincia.get(i).sesso, provincia.get(i).eta);
    etaSesso.increment(fascia);
  }
  etaSesso.sortKeys();
  return etaSesso.valueArray();
}

//ritorna la stringa corrispondente alla fascia di appartenenza dell'iscritto/a
String fasciaEta(String sesso, int eta) {
  if (eta >= 18 && eta <= 25) {
    if (sesso.equals("M")) {
      return "m_18-25";
    } else {
      return "f_18-25";
    }
  } else if (eta >= 26 && eta <= 35) {
    if (sesso.equals("M")) {
      return "m_26-35";
    } else {
      return "f_26-35";
    }
  } else if (eta >= 36 && eta <= 45) {
    if (sesso.equals("M")) {
      return "m_36-45";
    } else {
      return "f_36-45";
    }
  } else {
    if (sesso.equals("M")) {
      return "m_46-55";
    } else {
      return "f_46-55";
    }
  }
}
