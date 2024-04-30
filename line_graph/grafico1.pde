Table data; 
IntDict annoImmissione, uomini, donne;
int totImmMin, totImmMax;    //valori minimo e massimo di iscritti in un anno
int annoImmMin, annoImmMax;  //anno minimo e massimo di immissione
int uominiMin, uominiMax;    //valori minimo e massimo di uomini in un anno
int donneMin, donneMax;      //valori minimo e massimo di donne in un anno 
boolean changeViz = false;   //flag per slider modalità visualizzazione

//margini canvas
float MARGIN_OR = 70.0; 
float MARGIN_VER = 50.0; 

//colori utilizzati
color[] colors = {
  #F1F2F3, //[0] - background 
  #FF9900, //[1] - linegraph totali 
  #3E4377, //[2] - linegraph uomini
  #FD367E, //[3] - linegraph donne
  #C8C8C8, //[4] - griglia
  #646464, //[5] - testi griglia
  #94D14F, //[6] - toggle button
};

//TOGGLE BUTTON
//posizione
float st_x; 
float st_y; 

//dimensioni
int rWidth = 40; 
int rHeight = 20; 

boolean flagToggle = true;

void setup() {
  size(800, 700); 
  getData();
  pixelDensity(2); //migliora visualizzazione sui Retina

  st_x = width / 2;
  st_y = MARGIN_VER / 2;
}

void draw() {
  background(colors[0]);
  //surface.setTitle(int(frameRate) + "fps");
  drawGrill(changeViz);
  drawData();
  toggleButton(st_x, st_y);
}
