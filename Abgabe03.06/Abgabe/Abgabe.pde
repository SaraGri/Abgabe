//globale Variablen
//Bilder
PImage bg, h1, h2;
PImage img [] = new PImage [50];
//Font
PFont font;

boolean clicked;  

int max = 130;
int picCount;
//Objekte der Klasse Kreise
Kreise [] kreise; 
Kreise [] kreise2;
Kreise [] kreisefigur;

//Zum Erstellen der durchsichtigen, aufsteigenden Kreise, des 2. Bildes
//fängt beim 3.Array-Element an, da die ersten Elemente des Arrays für die Augen gedacht sind
void init(){
  color c;
  kreise = new Kreise [max];
  for (int i = 3; i < max; i++){
    kreise[i] = new Kreise ();
  }
  
 
  
  kreisefigur = new Kreise [max/2];
  for (int i = 0; i < max/2; i++){
    c = color(random(100,255), random(90,100), random(80,150), random(10,40));
    kreisefigur[i] = new Kreise (random(700,1200), random(0,710), random(10,100), c);
  }
  
}

//normales setup, ruft die init Funktion auf, legt Größe
void setup() {
  size(1203,712);
  init();
  //Laden der Hintergrundbilder
  h1 = loadImage("Bilder/hintergrund1.jpg");
  h2 = loadImage("Bilder/hintergrund2.jpg");
  //Variable clicked wird auf false gesetzt, count mit 0 initialisiert, 
  clicked = false;
  //Zähler für img Array Elemente
  picCount = 1;
  //Text
  font = loadFont("LucidaCalligraphy-Italic-48.vlw");
  textFont(font);
  background(h1);
  textSize(50);
  text("calorie", 50, 130);
  textSize(30);
  text("/'kaleori/", 50, 170);
  textSize(25);
  text("noun", 50, 210);
  textSize(30);
  text("a calorie is a tiny creatur that lives in your closets", 50, 280);
  text("and sews your clothes a little bit tighter every night", 50, 330);
  text("for more information,", 530, 500);
  fill(#FA3A50);
  text(" please click ", 880, 500);
  
}

//Click Event
void mouseClicked(){
  clicked = true;
  
}

//Zeichnen der Kreise im zweiten Bild
void drawKreis(){
  for (int i = 3; i < max; i++){
    kreise[i].drawkreis();
    kreise[i].update();
  }
  for (int i = 0; i < max/2; i++){
    kreisefigur[i].drawkreis();
    kreisefigur[i].update();
  }
}

void drawFigur(){
  //Augenbewegung
  //map(, min , max, zumappne, min, max)
  float pupil1x = map(mouseX, 0, width, 890, 910);
  float pupil1y = map(mouseY, 0, height, 540, 555);
  float pupil2x = map(mouseX, 0, width, 1000, 1020);
  float pupil2y = map(mouseY, 0, height, 520, 535);
  
  kreise[0] = new Kreise (pupil1x, pupil1y, 40, #FF90F2);
  kreise[1] = new Kreise (pupil2x, pupil2y, 40, #FF90F2);
  kreise[0].drawkreis();
  kreise[1].drawkreis();
}

void draw() {
  //Nach Auslösen des ClickEvents, wechsel des Hintergrunds, Animation der Figur
  if (clicked){
    background(h2);
    //Zeichnen der durchsichtigen Kreise
    drawKreis();
    //Zeichnen der Figur/Augen
    drawFigur();
    //Ohrenbewegung/Bildanimation, jeweils rechtes und linkes Ohr
    img[picCount] = loadImage("Bilder/n/n"+picCount+".png");
    img[picCount].resize(150,150);
       image(img[picCount], 960, 350);
       if (picCount < 13){
       picCount++;}
       else {picCount = 1;}
       
    img[picCount] = loadImage("Bilder/m/r"+picCount+".png");
    img[picCount].resize(150,102);
       image(img[picCount], 785, 415);
       if (picCount < 14){
       picCount++;}
       else {picCount = 1;}
     
  }
    
  noStroke();
  
}
