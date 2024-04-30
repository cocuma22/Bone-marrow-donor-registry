Table data; 
IntDict etaU, etaD;
int[] eta;          //array delle età degli uomini e delle donne
int[] etaUomini;    //array degli uomini per età
int[] etaDonne;     //array delle donne per età
int etaMin, etaMax; //età min e max degli uomini e delle donne
int uMin, uMax;     //quantità uomini min e max per età
int dMin, dMax;     //quantità donne min e max per età
boolean[] flag = {true, false, false, false};
int totaleUD;
boolean changeViz = false; //flag per slider modalità visualizzazione

//margini canvas
float MARGIN_VER = 130.0; 
float MARGIN_OR = 100.0;

//colori utilizzati
color[] colors = {
  #F1F2F3, //[0] - background 
  #FF9900, //[1] - arancio
  #3E4377, //[2] - bargraph uomini
  #FD367E, //[3] - bargraph donne
  #C8C8C8, //[4] - grigio chiaro
  #646464, //[5] - grigio scuro
  #94D14F, //[6] - verde
};

//TOGGLE BUTTON
//dimensioni
int rWidth = 40; 
int rHeight = 20; 
boolean flagToggle = true;

//posizione
float st_x; 
float st_y; 

void setup() {
  size(800, 700, P2D); 
  getData();
  st_x = width / 2;
  st_y = 20;
  pixelDensity(2); //migliora visualizzazione su Retina
}

void draw() {
  background(colors[0]);
  //surface.setTitle(int(frameRate) + "fps");
  checkViz();
  toggleButton(st_x, st_y);
}