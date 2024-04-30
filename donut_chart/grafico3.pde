ArrayList<Iscritto> udine = new ArrayList<Iscritto>();
ArrayList<Iscritto> pordenone = new ArrayList<Iscritto>();
ArrayList<Iscritto> gorizia = new ArrayList<Iscritto>();
ArrayList<Iscritto> venezia = new ArrayList<Iscritto>();
ArrayList<Iscritto> treviso = new ArrayList<Iscritto>();
ArrayList<Iscritto> trieste = new ArrayList<Iscritto>();
ArrayList<Iscritto> belluno = new ArrayList<Iscritto>();
ArrayList<Iscritto> altro = new ArrayList<Iscritto>();
ArrayList<ArrayList<Iscritto>> province = new ArrayList<ArrayList<Iscritto>>();
boolean checkMousePos = false;
String[] nomi= {"UDINE", "PORDENONE", "GORIZIA", "TRIESTE", "VENEZIA", "TREVISO", "BELLUNO", "ALTRO"};

color[] colors = {
  #F1F2F3, //[0] - background 
  #FF9900, //[1] - arancio 
  #C8C8C8, //[2] - grigio chiaro
  #646464, //[3] - grigio scuro
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
  drawData();
  legenda();
}

void getData() {
  Table data = loadTable("ud01.csv", "header");
  int colSesso = 0; 
  int colAnnoImmissione = 1; 
  int colAnnoNascita = 2; 
  int colProvincia = 3;
  
  //riempimento delle province con gli iscritti di appartenenza
  for (int i = 0; i < data.getRowCount(); i++) {
    String sesso = data.getString(i, colSesso);
    int annoImmissione = data.getInt(i, colAnnoImmissione);
    int eta = trovaEta(data.getInt(i, colAnnoNascita));
    String provincia = data.getString(i, colProvincia);
    switch(provincia) {
    case "UD":
      udine.add(new Iscritto(sesso, annoImmissione, eta, provincia)); 
      break;
    case "PN":
      pordenone.add(new Iscritto(sesso, annoImmissione, eta, provincia)); 
      break;
    case "GO":
      gorizia.add(new Iscritto(sesso, annoImmissione, eta, provincia)); 
      break;
    case "VE":
      venezia.add(new Iscritto(sesso, annoImmissione, eta, provincia)); 
      break;
    case "TV":
      treviso.add(new Iscritto(sesso, annoImmissione, eta, provincia)); 
      break;
    case "TS":
      trieste.add(new Iscritto(sesso, annoImmissione, eta, provincia));
      break;
    case "BL":
      belluno.add(new Iscritto(sesso, annoImmissione, eta, provincia));
      break;
    default:
      altro.add(new Iscritto(sesso, annoImmissione, eta, provincia));
    }
  }
  
  //inserimento delle province nell'ArrayList 'province'
  province.add(udine);
  province.add(pordenone);
  province.add(gorizia);
  province.add(trieste);
  province.add(venezia);
  province.add(treviso);
  province.add(belluno);
  province.add(altro);
}

void legenda() {
  noStroke();
  float posX = 100;
  float posY = height - 90;
  textSize(15);
  textAlign(RIGHT, TOP);
  fill(colors[3]);
  text("Females", posX - 10, posY);
  for (int i = 0; i < 8; i ++) {
    if (i == 4) {
      posX = 100;
      posY = height - 70;
      fill(colors[3]);
      text("Males", posX - 10, posY);
    }
    fill(getColor(i));
    rectMode(CORNER);
    rect(posX, posY, 40, 20);
    posX += 40;
  }
  posY = height - 50;
  posX = 100;
  fill(colors[3]);
  text("Age", posX - 10, posY);
  int min = 18;
  int max = 25;
  textSize(10);
  textAlign(LEFT, TOP);
  for (int i = 0; i < 4; i++) {
    text(min + "-" + max, posX + 4, posY + 5);
    min = max + 1;
    max += 10;
    posX += 40;
  }
}
