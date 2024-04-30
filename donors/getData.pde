import processing.javafx.*;

void getDataIscritti() {
  Table data = loadTable("ud01.csv", "header");
  int colSesso = 0;
  iscritti = new Persona[data.getRowCount()];

  //riempimento 'iscritti'
  for (int i = 0; i < iscritti.length; i++) {
    String sesso = data.getString(i, colSesso);
    if (sesso.equals("M")) {
      c_fill = colors[8];
      c_stroke = colors[6];
    } else {
      c_fill = colors[9];
      c_stroke = colors[7];
    }
    iscritti[i] = new Persona(sesso, c_fill, c_stroke);
  }
  n_iscrizioni = iscritti.length;
}

void getDataDonatori() {
  Table data = loadTable("donazioni.csv", "header");
  int colSesso = 1;
  donatori = new Persona[data.getRowCount()];
  iscritti_donatori = new Persona[data.getRowCount()];

  //riempimento 'donatori' e contatori di donatori
  for (int i = 0; i < donatori.length; i++) {
    String sesso = data.getString(i, colSesso);
    if (sesso.equals("M")) {
      n_donatori_u += 1;
      c_fill = colors[8];
      c_stroke = colors[6];
    } else {
      n_donatori_d += 1;
      c_fill = colors[9];
      c_stroke = colors[7];
    }
    donatori[i] = new Persona(sesso, c_fill, c_stroke, width/2, 486);
    iscritti_donatori[i] = new Persona(sesso, c_fill, c_stroke);
  }
}
