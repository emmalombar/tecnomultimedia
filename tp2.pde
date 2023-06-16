//Emma Lombar
//Comision 1
//https://youtu.be/qRJNaOcK0Jw

PImage obra;
int cant = 11;

String colores = "coloresbase" ;
color relleno, fondo, base;
color amarillo, violetaO, rosa, verde, azul, violetaC, cyan, magenta, verdeO, naranja, rojo, negro;

void setup() {
  size (800, 400);
  background (255);
  obra = loadImage ("obra.jpg");

  amarillo = color (254, 255, 1);
  violetaO = color (141, 1, 87, 100);
  rosa = color(202, 1, 117);

  verde = color (1, 252, 19);
  violetaC = color (122, 1, 126);
  azul = color (95, 1, 217);

  cyan = color (1, 252, 206);
  verdeO = color (7, 126, 1);
  magenta = color (217, 1, 210);

  naranja = color (255, 170, 0);
  rojo = color (255, 0, 0);
  negro = color (0);

  relleno = amarillo;
  fondo = violetaO;
  base = rosa;
}

void draw () {

  image (obra, 0, 0, 400, 400);

  if (colores.equals("coloresbase")) {
    relleno = amarillo;
    fondo = violetaO;
    base = rosa;
  } else if (colores.equals("colores1")) {
    relleno = verde;
    fondo = violetaC;
    base = azul;
  } else if (colores.equals("colores2")) {
    relleno = cyan;
    fondo = verdeO;
    base = magenta;
  } else if (colores.equals("colores3")) {
    relleno = naranja;
    fondo = negro;
    base = rojo;
  }

  fondo();

  push();
  translate(600, 200);
  rotate (radians(45));

  push();
  cuadrante();
  pop();

  push();
  rotate (radians(90));
  cuadrante();
  pop();

  push();
  rotate (radians(180));
  cuadrante();
  pop();

  push();
  rotate (radians(270));
  cuadrante();
  pop();
  pop();
}


void fondo() {
  push();
  rectMode(CENTER);
  noStroke();
  fill (fondo);
  rect (600, 200, 344, 344);
  pop();
}

void cuadrante () {
  for (int x=0; x<cant; x++) {
    for (int y=0; y<cant; y++) {
      float ancho = map(x, 0, cant-1, 24, 6);
      float alto = map(y, 0, cant-1, 24, 6);
      float posX = map(ancho, 24, 6, 0, 265);
      float posY = map(alto, 24, 6, 0, 265) ;

      if ((x+y) < 11) {
        if (x == 2) {
          posX = posX - 2;
        } else if (x == 3) {
          posX = posX - 6;
        } else if (x == 4) {
          posX = posX - 14;
        } else if (x == 5) {
          posX = posX - 24;
        } else if (x == 6) {
          posX = posX - 35;
        } else if (x == 7) {
          posX = posX - 48;
        } else if (x == 8) {
          posX = posX - 62;
        } else if (x == 9) {
          posX = posX - 80;
        } else if (x == 10) {
          posX = posX - 100;
        }

        if (y == 2) {
          posY = posY - 2;
        } else if (y == 3) {
          posY = posY - 6;
        } else if (y == 4) {
          posY = posY - 14;
        } else if (y == 5) {
          posY = posY - 24;
        } else if (y == 6) {
          posY = posY - 35;
        } else if (y == 7) {
          posY = posY - 48;
        } else if (y == 8) {
          posY = posY - 62;
        } else if (y == 9) {
          posY = posY - 80;
        } else if (y == 10) {
          posY = posY - 100;
        }

        float d = dist(mouseX -400, mouseY, posX, posY);
        float tono = d*255/dist(400, 0, 600, 200);


        rectMode(CENTER);
        stroke (166, 132, 253);
        strokeWeight (3);

        fill(base);
        rect(posX, posY, ancho, alto);

        fill(relleno, tono);
        rect(posX, posY, ancho, alto);
      }
    }
  }
}

void mouseClicked () {


  if (colores == "coloresbase" && mouseX >400 && mouseY>0 && mouseX <800 && mouseY <400) {
    colores = "colores1";
  } else if (colores == "colores1" && mouseX >400 && mouseY>0 && mouseX <800 && mouseY <400) {
    colores = "colores2";
  }else if (colores == "colores2" && mouseX >400 && mouseY>0 && mouseX <800 && mouseY <400) {
    colores = "colores3";
  }else if (colores == "colores3" && mouseX >400 && mouseY>0 && mouseX <800 && mouseY <400) {
    colores = "colores1";
  }
}

void keyPressed() {
  if (key == ' ') {
    colores = "coloresbase";
  }
}
