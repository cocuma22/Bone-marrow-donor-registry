ArrayList<Persona> italia = new ArrayList<Persona>();
ArrayList<Persona> estero = new ArrayList<Persona>();
ArrayList<Persona> creste_iliache = new ArrayList<Persona>();
ArrayList<Persona> sangue_periferico = new ArrayList<Persona>();
int[] destinazione = new int[2];   //[0] Italia, [1] estero
int[] destinazione_sesso = new int[4]; //[0] n uomini IT, [1] n donne IT, [2] uomini estero, [3] donne estero
int[] modalita = new int[2];       //[0] creste iliache, [1] sangue periferico
int[] modalita_sesso = new int[4]; //[0] n uomini CI, [1] n donne CI, [2] uomini SP, [3] donne SP
int italia_uomini, italia_donne, estero_uomini, estero_donne; //contatori sesso divisi per destinazione
int creste_uomini, creste_donne, sangue_uomini, sangue_donne; //contatori sesso divisi per modalita di donazione
boolean flagToggle = true;
boolean changeViz = false; //flag per slider modalità visualizzazione

color[] coloriSessi = {
  #6FC5F2,//[1] uomini
  #FD9ABE,//[2] donne
};

color[] coloriDestinazione = {
  #CBF078, //[0] - italia
  #F8F398  //[1] - estero
};

color[] coloriModalita = {
  #F9DA5A, //[0] - creste iliache
  #FB755E,///[1] - sangue periferico
};

color[] colors = {
  #F1F2F3, //[0] - background 
  #FF9900, //[1] - arancione
  #C8C8C8, //[2] - grigio chiaro
  #646464, //[3] - grigio scurso
  #94D14F, //[4] - verde
};

void setup() {
  size(800, 700, P2D); 
  pixelDensity(2);
  getData();
}

void draw() {
  background(colors[0]);
  //surface.setTitle(int(frameRate) + "fps");
  disegnaVis();
  toggleButton(width/2, 25);
}

void toggleButton(float posX, float posY) { 
  rectMode(CENTER);
  stroke(colors[3]);
  fill(colors[4]);
  strokeWeight(1);
  rect(posX, posY, 40, 20, 10);
  noStroke();

  if (flagToggle) {
    fill(255);
    ellipse(posX - 40 / 4, posY, 20, 20);
  } else {
    fill(255);
    ellipse(posX + 40 / 4, posY, 20, 20);
  }
}

void mousePressed() {
  if (mouseX > (width/2 - 40/2) && mouseX < (width/2 + 40/2) && mouseY > (25 - 20/2) && mouseY < (25 + 20/2)) {
    changeViz = !changeViz;
    flagToggle = !flagToggle;
  }
}

void getData() {
  Table data = loadTable("donazioni.csv", "header");
  int colSesso = 1; 
  int colDestinazione = 3; 
  int colModalita = 5;
  
  //riempimento degli ArrayList
  for(int i = 0; i < data.getRowCount(); i++) {
    String sesso = data.getString(i, colSesso);
    String destinazione = data.getString(i, colDestinazione);
    String modalita = data.getString(i, colModalita);
    
    //riempimento degli ArrayList 'italia' e 'estero'
    if(destinazione.equals("ITALIA")) {
      italia.add(new Persona(sesso, destinazione, modalita));
    } else {
      estero.add(new Persona(sesso, destinazione, modalita));
    }
    
    //riempimento contatori per la destinazione e la modalita
    if(sesso.equals("M")) {
      if(destinazione.equals("ITALIA")){
        italia_uomini += 1;
      } else {
        estero_uomini += 1;
      }
      
      if(modalita.equals("MO")) {
        creste_uomini += 1; 
      } else {
        sangue_uomini += 1;
      }
    } else {
      if(destinazione.equals("ITALIA")) {
        italia_donne += 1; 
      } else {
        estero_donne += 1;
      }
      
      if(modalita.equals("MO")) {
        creste_donne += 1; 
      } else {
        sangue_donne += 1;
      }
    }
    
    //riempimento degli ArrayList 'creste_iliache' e 'sangue_periferico'
    if(modalita.equals("MO")) {
      creste_iliache.add(new Persona(sesso, destinazione, modalita)); 
    } else {
      sangue_periferico.add(new Persona(sesso, destinazione, modalita)); 
    }
  }
  
  //riempimento array 'destinazione'
  destinazione[0] = italia.size();
  destinazione[1] = estero.size();
  
  //riempimento array 'destinazione_sesso'
  destinazione_sesso[0] = italia_uomini; 
  destinazione_sesso[1] = italia_donne; 
  destinazione_sesso[2] = estero_uomini; 
  destinazione_sesso[3] = estero_donne;
  
  //riempimento array 'modalita'
  modalita[0] = creste_iliache.size();
  modalita[1] = sangue_periferico.size();
  
  //riempimento array 'modalita_sesso'
  modalita_sesso[0] = creste_uomini;
  modalita_sesso[1] = creste_donne; 
  modalita_sesso[2] = sangue_uomini;
  modalita_sesso[3] = sangue_donne;
}
