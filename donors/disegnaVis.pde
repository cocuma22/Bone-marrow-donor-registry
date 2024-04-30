void disegnaVis() {
  scatolaIscritti();
  disegnaIscritti();
  scatolaDonatori();
  manopola();
}

void scatolaIscritti() {
  rectMode(CENTER);
  strokeWeight(5);
  stroke(colors[5]);
  fill(colors[0]);
  rect(width/2, 208 + MARGIN_Y, width - 190, 396, 5); //contenitore palline
  fill(colors[5]);
  strokeWeight(1);
  rect(width/2, 418 + MARGIN_Y, 200, 20, 5); //rettangolino inferiore
  quad(width/2 - 75, 428 + MARGIN_Y, width/2 + 75, 428 + MARGIN_Y, width/2 + 3, 490, width/2 - 3, 490); //sputa-palline
}

void disegnaIscritti() {
  int MARGIN_X = 100;
  float x = MARGIN_X; 
  float y = height/2 + 50 + MARGIN_Y;
  int dim = 5;
  int contaU = 0; //contatore uomini
  int contaD = 0; //contatore donne
  int j = 0;

  //iscritti non donatori
  for (int i = 0; i < iscritti.length - donatori.length; i++) {
    if (iscritti[i].sesso.equals("M") && contaU < n_donatori_u) {
      contaU += 1;
    } else if (iscritti[i].sesso.equals("F") && contaD < n_donatori_d) {
      contaD += 1;
    } else {
      iscritti[j].posX = x; 
      iscritti[j].posY = y;
      iscritti[j].disegna();
      x += dim;
      if (x > width - MARGIN_X) {
        x = MARGIN_X;
        y -= dim;
      }
      j++;
    }
  }

  //iscritti donatori (disegnati in cima per essere 'scalati' uno alla volta)
  for (int i = iscritti_donatori.length - 1; i >= 0; i--) {
    iscritti_donatori[i].posX = x; 
    iscritti_donatori[i].posY = y; 
    iscritti_donatori[i].disegna();
    x += dim;
    if (x > width - MARGIN_X) {
      x = MARGIN_X;
      y -= dim;
    }
  }
}

void scatolaDonatori() {
  stroke(colors[5]);
  rectMode(CORNER);
  fill(colors[5]);
  rect(287, 525, 20, 175, 5);        //lato sinistro
  rect(492, 525, 20, 175, 5);        //lato destro
  rect(300, height - 35, 200, 35);   //base
  strokeWeight(1);
}

void manopola() {
  rectMode(CENTER);
  rect(width - 70, 210 + MARGIN_Y, 55, 100, 10); //supporto manopola
  fill(colors[10]);
  stroke(colors[10]);
  ellipse(width - 70, 210 + MARGIN_Y, 45, 45); //manopola

  if (controllaColore && mousePressed && mouseX > width - 91.5 && mouseX < width - 48.5 &&
    mouseY > 200 + MARGIN_Y && mouseY < 220 + MARGIN_Y) {
    reset_palline();
    reset_manopola();
    premuto = true;
  }
  if (premuto && angolo <= TWO_PI) {
    gira_manopola();
  } else {
    if (angolo >= TWO_PI) {
      etichetta_avvia(colors[3], colors[2]);
      disegnaDonatori();

      contatore("DONATIONS: ", n_donazioni, 326, height-17);
      contatore("REGISTRATIONS: ", n_iscrizioni, 319, 414 + MARGIN_Y);

      if (n_donazioni == donatori.length) {
        etichetta_avvia(colors[5], colors[0]);
      }
    } else {
      reset_manopola();
    }
  }
}

void reset_palline() {
  index = 0; 
  j = 0;
  valore_y = 39;
  n_donazioni = 0; 
  n_iscrizioni = iscritti.length;
  for (int i = 0; i < donatori.length; i++) {
    donatori[i].posX = width/2;
    donatori[i].posY = 486;
    if (donatori[i].sesso.equals("M")) {
      c_fill = colors[8];
      c_stroke = colors[6];
    } else {
      c_fill = colors[9];
      c_stroke = colors[7];
    }
    iscritti_donatori[i].fill =  c_fill;
    iscritti_donatori[i].stroke = c_stroke;
  }
}

void reset_manopola() {
  angolo = 0;
  premuto = false;
  etichetta_avvia(colors[5], colors[0]);
}

void gira_manopola() {
  pushMatrix();
  translate(width - 70, 210 + MARGIN_Y);
  rotate(angolo);
  fill(colors[5]);
  rectMode(CENTER);
  rect(0, 0, 43, 20, 5);
  fill(colors[0]);
  textAlign(CENTER, TOP);
  textSize(12);
  text("START", 0, -7);
  popMatrix();
  angolo += 0.05;
}

void etichetta_avvia(color sfondo, color scritta) {
  rectMode(CENTER);
  if(sfondo == colors[5]) {
    controllaColore = true;
  } else if(sfondo == colors[3]) {
    controllaColore = false;
  }
  fill(sfondo);
  stroke(colors[10]);
  rect(width - 70, 210 + MARGIN_Y, 43, 20, 5);
  fill(scritta);
  textAlign(CENTER, TOP);
  textSize(12);
  text("START", width - 70, 203 + MARGIN_Y);
}

void disegnaDonatori() {
  if (index < donatori.length) {
    if (!donatori[index].muovi(valore_y, j)) {
      iscritti_donatori[index].cambiaColore();
      n_donazioni += 1; 
      n_iscrizioni -= 1;
      index++;
      j++;
      lato = -lato;
      if (index % 31 == 0) {
        valore_y += 5;
        j = 0;
        lato = -lato;
      }
    }
  }
  for (int i = 0; i <= index && i < donatori.length; i++) {
    donatori[i].disegna();
  }
}

void contatore(String testo, int n, float x, float y) {
  fill(colors[0]);
  textSize(20);
  textAlign(LEFT, CENTER);
  text(testo + n, x, y);
}
