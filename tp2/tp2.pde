/*
"Depeche Mode", Banda
Alumno: Fernandez Jesser Benjamin
Comision: 3
Legajo: 122395/2
*/

int pantalla = 0;
int tiempo;

PImage Menu, P1, P2, P3, P4, P5, FilmRed, MementoMori; 
PFont FuenteTNR;

float xTexto = 800;
float yTexto = 600;

boolean inicio = false;

void setup() { 
 size(640, 480);
 
 Menu = loadImage("DepecheMode0.jpg");
 P1 = loadImage("DepecheMode1.jpg");
 P2 = loadImage("DepecheMode2.jpg");
 P3 = loadImage("DepecheMode3.jpg");
 P4 = loadImage("DepecheMode4.jpg");
 P5 = loadImage("DepecheMode5.jpg");
 FilmRed = loadImage("DepecheMode6.jpg");
 MementoMori= loadImage("DepecheMode7.jpg"); // Corregido para que coincida con la variable declarada
  
 FuenteTNR = loadFont("OCRAExtended-48.vlw");
 textFont(FuenteTNR, 16);
 
 tiempo = millis();
}

void draw() {
 if (inicio == true) {
   if (millis() - tiempo > 10000) {
    pantalla++;
    tiempo = millis();
    
    yTexto = 600;
    xTexto = 800;
   }
 }
 
 if (pantalla == 0) {
   image(Menu, 0, 0, width, height);
   
   fill(50, 100, 255);
   rect(220, 350, 200, 60);
   fill(255);
   textSize(30);
   text("Comenzar", 260, 390);
 }
 
 if (pantalla == 1) {
   background(0);
   image(P1, 0, 0, width, height);
   
   fill(0);
   rect(10, 350, 620, 60);
   fill(255);
   textSize(16);
   text("En 1981, Depeche Mode lanzó su álbum debut 'Speak & Spell',\nimpulsado por el éxito 'Just Can't Get Enough', un clásico del \nsynth-pop.", 15, yTexto);
   if (yTexto > 370) {
     yTexto -= 2;
   }
 }
  
 if (pantalla == 2) {
   background(0);
   image(P2, 0, 0, width, height);
   
   fill(0);
   rect(10, 350, 620, 60);
   fill(255);
   textSize(16);
   text("En 1984 lanzaron 'People Are People', su primer gran éxito\nen Estados Unidos, consolidando su sonido y fama internacional.", xTexto, 370);
   if (xTexto > 15) {
     xTexto -= 5;
   }
 }
 
 if (pantalla == 3) {
   background(0);
   image(P3, 0, 0, width, height);
   
   fill(0);
   rect(10, 350, 620, 60);
   fill(255);
   textSize(16);
   text("Su obra maestra de 1990, el icónico álbum 'Violator',\nincluye su éxito más legendario y aclamado mundialmente: \n'Enjoy the Silence'.", 15, yTexto);
   if (yTexto > 370) {
     yTexto -= 2;
   }
 }
 
 if (pantalla == 4) {
   background(0);
   image(P4, 0, 0, width, height);
   
   fill(0);
   rect(10, 350, 620, 60);
   fill(255);
   textSize(16);
   text("'Personal Jesus', también del álbum 'Violator', revolucionó su \nestilo al mezclar sintetizadores oscuros con potentes riffs de \nguitarra.", xTexto, 370);
   if (xTexto > 15) {
     xTexto -= 5;
   }
 }
 
 if (pantalla == 5) {
   background(0);
   image(P5, 0, 0, width, height);
   
   fill(0);
   rect(10, 350, 620, 60);
   fill(255);
   textSize(16);
   text("Con más de 40 años de trayectoria, la banda británica ha superado la\nventa de 100 millones de discos alrededor de todo el mundo.", 15, yTexto);
   if (yTexto > 370) {
     yTexto -= 2;
   }
 }
 
 if (pantalla == 6) {
   background(0);
   image(FilmRed, 80, 150, 200, 200);
   image(MementoMori, 380, 150, 200, 200);
   
   fill(255);
   textSize(16);
   text("Fueron inducidos al Salón\nde la Fama del Rock en 2020", xTexto, 100);
   text("En 2023 lanzaron 'Memento Mori',\nun emotivo álbum y gira mundial", 350, yTexto);
   if (xTexto > 80) {
     xTexto -= 4;
   }
   if (yTexto > 370) {
     yTexto -= 2;
   }
 }
 
 if (pantalla == 7) {
   background(0);
   textSize(26);
   text("Fin.", 294, height/2);
   
   fill(50, 100, 255);
   rect(220, 350, 200, 60);
   fill(255);
   textSize(30);
   text("Reiniciar", 260, 390);
 }
}

void mousePressed() {
  if (pantalla == 0 && mouseX > 220 && mouseX < 420 && mouseY > 350 && mouseY < 410) {
    inicio = true;
    pantalla = 1;
    tiempo = millis();
  }
  
  if (pantalla == 7 && mouseX > 220 && mouseX < 420 && mouseY > 350 && mouseY < 410) {
    inicio = false;
    pantalla = 0;
    tiempo = millis();
  }
}
