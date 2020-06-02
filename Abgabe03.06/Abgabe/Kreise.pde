class Kreise {

  //Eigenschaften
  float x, y, w, h, speedY;
  color c;
  //Konstruktoren
  Kreise(){
  x = random(0,1200);
  y = random(0, 710);
  w = random(3,40);
  h = w;
  speedY = random(0.01, 3);
 // c = random(0,255);
  c = color(random(100,255), random(0,255), random(50,250), random(10,70));
  }
  
  Kreise(float x, float y, float w, color c){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = w;
    this.c = c;
    this.speedY = random(0.01, 3);
  }
 
 void drawkreis(){
   fill(c);
   ellipse(x,y,w,h);
   
 }
 
 void update(){
   if (y > 0){
     y = y - speedY;
   }
   else {
     y = 712;
   }
 }

}
