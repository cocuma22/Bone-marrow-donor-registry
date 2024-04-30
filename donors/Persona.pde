class Persona {
  //proprietà
  String sesso; 
  float posX, posY;
  color fill, stroke;

  //costruttori
  Persona(String _sesso, color _fill, color _stroke) {
    sesso = _sesso;
    posX = 0; 
    posY = 0;
    fill = _fill;
    stroke = _stroke;
  }

  Persona(String _sesso, color _fill, color _stroke, float _posX, float _posY) {
    sesso = _sesso;
    fill = _fill;
    stroke = _stroke;
    posX = _posX;
    posY = _posY;
  }

  //metodi
  void  disegna() {
    fill(fill);
    stroke(stroke);
    ellipse(posX, posY, 5, 5);
  }

  boolean muovi(int value, int j) {
    if (posY < height - value || (posX > 312+j*3 && posX < 491-j*3) ) {
      if (posY < height - value) {
        posY += 6.0;
      } else if (posX > 312+j*3 && posX < 491-j*3) {
        posX += 6.0 * lato;
      }
      return true;
    } 
    return false;
  }

  void cambiaColore() {
    stroke = color(183, 14, 14);//colors[3];
    fill = color(255, 0, 0);//colors[2];
  }
}