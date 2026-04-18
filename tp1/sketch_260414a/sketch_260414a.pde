PImage miImage ;


void setup() {
  size(800, 400);
  background(60);

  miImage = loadImage("tp1.jpg");
}
void draw() {
  image(miImage, 0, 0, 400, 400);


  stroke(30);
  strokeWeight(2);
  for (int i = 0; i < height; i += 12)
    line(0, i, width, i);

  pushMatrix();
  translate(400, -30);

  // pelo 
  noStroke();
  fill(190, 45, 65); 
  ellipse(100, 340, 95, 85);
  ellipse(200, 365, 115, 95);
  ellipse(300, 340, 95, 85);
  ellipse(679, 105, 115, 95);



  // aritos 
  fill(255, 210, 0);
  ellipse(55, 210, 35, 35);
  ellipse(345, 210, 35, 35);
  ellipse(55, 240, 35, 35);
  ellipse(345, 240, 35, 35);

  fill(240, 190, 20);
  ellipse(135, 120, 150, 110);
  stroke(0);
  strokeWeight(3);
  line(115, 100, 135, 140);
  line(140, 105, 120, 135);


  noStroke();
  fill(210, 40, 45);
  arc(235, 125, 230, 140, PI, TWO_PI);
  stroke(245, 210, 20);
  noFill();
  strokeWeight(10);
  arc(235, 125, 230, 140, PI + QUARTER_PI, TWO_PI);

  // --- CARA AZUL ---
  noStroke();
  fill(95, 195, 235); 
  ellipse(200, 235, 290, 220);
  fill(255, 130, 170, 160);
  ellipse(587, 214, 50, 30);


  // --- OJOS (Capas para profundidad) ---
  fill(255); // Blanco de los ojos
  ellipse(145, 215, 85, 80);
  ellipse(255, 215, 85, 80);


  fill(255, 185, 0);
  ellipse(145, 215, 45, 45);
  ellipse(255, 215, 45, 45);

  fill(0); // Pupila negra
  ellipse(145, 215, 18, 18);
  ellipse(255, 215, 18, 18);

  fill(255); // Brillo blanco pequeño
  ellipse(152, 210, 6, 6);
  ellipse(262, 210, 6, 6);

  // cachete
  fill(255, 130, 170, 160);
  ellipse(125, 280, 80, 70);
  

  // --- BOCA Y DIENTES ---
  fill(20); // Interior oscuro
  stroke(0);
  strokeWeight(2);
  arc(215, 290, 150, 90, 0, PI); // Forma de la boca [5]

  noStroke();
  fill(255); // Dientes rectangulares [1]
  rect(180, 290, 22, 20);
  rect(208, 290, 24, 25);
  rect(238, 290, 22, 20);

  fill(255, 110, 160); // Lengua
  ellipse(215, 330, 50, 20);

  popMatrix(); // Cierra la transformación de la mitad derecha [3]
}
