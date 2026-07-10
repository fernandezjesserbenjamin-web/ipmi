PImage imagen1, imagen2, imagen3;

float tamTexto = 10;  
float textObra = 500;

PFont t; // variable de tipografía

//títulos
String titulo = "Depeche Mode";
String info = "Depeche Mode es una de las bandas más influyentes en la historia de la música electrónica y el rock alternativo. Formados en 1980 en la ciudad de Basildon, Inglaterra, fueron pioneros del synth-pop en sus inicios y, con el tiempo, evolucionaron hacia un sonido más oscuro, denso y atmosférico que definió a toda una generación.";
String musicos = "Actual  Dave Gahan  Vocalista principal y compositor ocasional Actual  Martin Gore  Teclados, guitarra, voz y compositor principalFallecido  Andy Fletcher  Teclados y bajo (1980 - 2022)Ex-miembro  Alan Wilder  Teclados, batería y arreglos (1982 - 1995)Ex-miembro  Vince Clarke  Teclados y compositor principal original (1980 - 1981)";  

float xAutor;

// posición y tamaño del círculo
int posX = 575;
int posY = 415;
int anchoBot = 50;
int altoBot = 50;

//void setup para fuente e imagenes
void setup() {
  size(640, 480);
  t = loadFont("FootlightMTLight-48.vlw");
  textFont(t, 35);
  imagen1 = loadImage("DepecheModeMarca.jpg");
  imagen2 = loadImage("DepecheModeBanda.jpg");
  imagen3 = loadImage("DepecheModeAlbum.jpg");

  xAutor = width;
}

void draw() {
  background(255);

  // Primera imagen
  if (tamTexto < 200) {  //duración de tiempo en pantalla
    image(imagen1, 0, 0);
    textSize(tamTexto);
    fill(255);

    float anchoTexto = textWidth(titulo); //centrar texto
    float x = (width - anchoTexto) / 2; //centro pantalla eje x
    float y = height / 2;   //centro pantalla eje y
    text(titulo, x, y);

    tamTexto += 0.2; // la velocidad a la que crece
  }

  // Segunda imagen
  else if (textObra > -200) {  // Si termino (tamTexto >= 200) y textObra es mayor que -200, se ejecuta
    image(imagen2, 0, 0);
    textSize(25);
    fill(255);

    float anchoTexto = textWidth(info);  //mide el texto para centrarlo
    float x = (width - anchoTexto) / 2;  //posiciona el texto en el centro de la pantalla

      text(info, x, textObra);
    textObra -= 1;  //el texto se desliza hacia arriba
  }

  // Tercera imagen
  else {
    image(imagen3, 0, 0);
    textSize(35);
    fill(255);

    xAutor -= 2;  //Mueve el texto 2px a la izquierda
    if (xAutor < -textWidth(autor)) { //se desliza infinitamente
      xAutor = width;
    }
}
    text(autor, xAutor, height / 2); 

    // botón
    if (mouseX > posX && mouseX < posX + anchoBot && 
        mouseY > posY && mouseY < posY + altoBot) {  //controla que el mouse este encima del bot
      fill(200); // gris si el mouse pasa por encima
    } else {
      fill(13,39,139); // azul si no
    }

    // Figura del botón
    circle(posX + 25, posY + 25, 50);  //posición inferior derecha

    // Texto del botón
    fill(0);
    textSize(10);
    text("Reiniciar", posX + 7, posY + 30);  //texto dentro del bot
  }


void mousePressed() { // Se reinicia cuando hago clic en el bot
  if (tamTexto >= 150 && textObra <= -200) {  //controla q tamtexto y textActores tenga el valor porque ya se mostro imagen 1 y 2
    if (mouseX > posX && mouseX < posX + anchoBot &&
        mouseY > posY && mouseY < posY + altoBot) {
      
      tamTexto = 10;
      textObra = 500;
      xAutor = width;
    }
  }
}
