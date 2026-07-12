// Benjamin Fernandez Jesser Com 3 Legajo 122395/2
// https://youtu.be/wPWrhtrB4cw



// VARIABLES GLOBALES
PImage imgOriginal;
int tamanoModulo = 50; // tamaño de cada celda del patron (8x8 caben en 400px)
color colorBlanco = color(255);
color colorGris = color(150);
color colorNegro = color(0);

// variables para interactividad y reinicio
float anguloRotacion = 0;
boolean modoInteractivo = false;

void setup() {
  size(800, 400); 
  
  imgOriginal = loadImage("25.jpg");
}

void draw() {
  background(220);

  //  IMAGEN ORIGINAL 
  if (imgOriginal != null) {
    image(imgOriginal, 0, 0, 400, 400);
  } 

  // linea divisoria roja central
  stroke(255, 0, 0);
  strokeWeight(2);
  line(400, 0, 400, height);
  noStroke();

  // genera un leve pulso en el color blanco si esta en modo interactivo
  color colorBlancoActual = colorBlanco;
  if (modoInteractivo) {
    float pulso = map(sin(millis() / 200.0), -1, 1, 200, 255);
    colorBlancoActual = color(pulso);
  }

  //  mi dibujo 
  // CICLOS FOR ANIDADOS
  for (int x = 400; x < width; x += tamanoModulo) {
    for (int y = 0; y < height; y += tamanoModulo) {
      
      // calculo el centro del modulo actual
      float centroX = x + tamanoModulo / 2.0;
      float centroY = y + tamanoModulo / 2.0;
      
      //FUNCION QUE RETORNA VALOR: calculo distancia al mouse
      float distanciaMouse = calcularDistancia(mouseX, mouseY, centroX, centroY);
      
      float anguloActual = anguloRotacion;
      
      // CONDICIONAL (if - else) 
      // si el mouse esta cerca del modulo y estamos en la mitad derecha, rotar levemente
      if (distanciaMouse < 60 && mouseX > 400 && modoInteractivo) {
        anguloActual = map(distanciaMouse, 0, 60, PI/4, 0);
      } else {
        anguloActual = 0; // estado normal
      }
      
      // LLAMADA A FUNCION QUE NO RETORNA VALOR (dibuja el patrón)
      dibujarModulo(x, y, tamanoModulo, anguloActual, colorBlancoActual, colorGris, colorNegro);
    }
  }
}

// FUNCION PROPIA 
void dibujarModulo(float posX, float posY, float tam, float angulo, color cBlanco, color cGris, color cNegro) {
  // USO DE ROTATE Y TRANSLATE
  pushMatrix();
  // trasladar al centro del modulo para que rote sobre su propio eje
  translate(posX + tam / 2, posY + tam / 2);
  rotate(angulo);
  // devolver el punto de origen a la esquina superior izquierda del módulo
  translate(-tam / 2, -tam / 2);

  noStroke();

  // fondo general (Negro)
  fill(cNegro);
  rect(0, 0, tam, tam);

  // cuadrado Blanco (Moverlo a la parte inferior derecha)
  fill(cBlanco);
  rect(tam / 2, tam / 2, tam / 2, tam / 2);

  // sombra superior (triangulo gris pegado arriba del cuadrado blanco)
  fill(cGris);
  triangle(tam / 2, 0, tam / 2, tam / 2, tam, tam / 2);
  
  // sombra izquierda (triangulo gris pegado a la izquierda del cuadrado blanco)
  fill(cGris);
  triangle(0, tam / 2, tam / 2, tam / 2, tam / 2, tam);
  
  popMatrix();
}

float calcularDistancia(float x1, float y1, float x2, float y2) {
  // uso de función matematica dist()
  return dist(x1, y1, x2, y2);
}

// EVENTOS DE MOUSE
void mousePressed() {
  
  // solo se activa si se hace clic estrictamente en la mitad derecha
  if (mouseX > 400 && mouseX < width && mouseY > 0 && mouseY < height) {
    modoInteractivo = !modoInteractivo; // Activa/Desactiva el efecto visual
    
    // cambia a un gris aleatorio usando la funcion random
    if (modoInteractivo) {
      colorGris = color(random(100, 200));
    }
  }
}

// ---------------------------------------------------------
// EVENTOS DE TECLADO: reiniciar el programa
// ---------------------------------------------------------
void keyPressed() {
  // REINICIAR VARIABLES AL ESTADO ORIGINAL
  if (key == 'r' || key == 'R') {
    tamanoModulo = 50;
    colorBlanco = color(255);
    colorGris = color(150);
    colorNegro = color(0);
    anguloRotacion = 0;
    modoInteractivo = false;
  }
}
