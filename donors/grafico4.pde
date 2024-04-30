Persona[] iscritti; 
Persona[] donatori;
Persona[] iscritti_donatori; //donatori scalati dagli iscritti
int n_donatori_u = 0;        //contatore donatori uomini
int n_donatori_d = 0;        //contatore donatori donne
color c_fill, c_stroke;      //colori di riempimento e contorno
int n_donazioni = 0;         //contatore donazioni
int n_iscrizioni;            //contatore iscrizioni
int MARGIN_Y = 30;
int index = 0; 
int j = 0; 
int lato = -1; 
int valore_y = 39;
float angolo = 0;
boolean premuto = false;
boolean controllaColore = true;

color[] colors = {
  #F1F2F3, //[0]  - background 
  #FF9900, //[1]  - arancio
  #C8C8C8, //[2]  - grigio chiaro
  #646464, //[3]  - grigio scuro
  #94D14F, //[4]  - verde
  #5E3700, //[5]  - marrone scuro
  #1934E5, //[6]  - uomini - scuro
  #FD367E, //[7]  - donne - scuro
  #A3ACE5, //[8]  - uomini - chiaro
  #FD9ABE, //[9]  - donne  - chiaro
  #382811  //[10] - marrone chiaro
};

void setup() {
  size(800, 700, FX2D);
  background(colors[0]);
  //surface.setTitle(int(frameRate) + "fps");
  pixelDensity(2);
  getDataDonatori();
  getDataIscritti();
}

void draw() {
  background(colors[0]);
  disegnaVis();
}