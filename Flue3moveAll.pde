ArrayList<Flue> flueListe = new ArrayList<Flue>(); //Arrayliste med fluer

void setup(){
  size(500,500); //Tegnefladen
}

void draw(){
  background(250);
  for(int i=0; i<flueListe.size(); i++){ //Fluen kommer til live
    Flue f = flueListe.get(i);
    if (key == 'e'){
      f.tegnFlue(5);
      f.flyt();
    }
    if (key != 'e') {
      f.tegnFlue(1);
      f.flyt();
    }
    
  }
}

void keyPressed(){ 
  flueListe.add(new Flue(random(0,height), random(0,height), random(0,2*PI))); //Tilføjer fluen ved hvert tryk ved en knap
}

void mousePressed(){
  flueListe.add(new Flue(mouseX, mouseY)); //Tilføjer en flue ved tryk med mus, fødes ved musens position
}

////////////////////////Fluens klasse/////////////////////////////////
class Flue{
  
  float positionX = random(0, height);
  float positionY = random(0, height); //Position
  float distanceFlyttet; //Afstand
  float vinkel = random(0,2*PI); //Vinkel
  float speed = 0.5;
  
  Flue(float positionX, float positionY, float vinkel){
    
  }
  
  Flue(float a, float b){
    positionX = a; //X-Positionen er afgjordt(Mus)
    positionY = b; //Y-Positionen er afgjordt(Mus)
    vinkel    = random(0,2*PI); //Vinklen er Random
  }
  
  void flyt(){ 
    distanceFlyttet = distanceFlyttet + speed; //Bevægelse af fluen
    if ((cos(vinkel) * (distanceFlyttet)  + positionX) > width ||
      (cos(vinkel) * (distanceFlyttet)  + positionX) < 0) { // Fluen bevæger sig indtil bredden er nået

      speed *= -1; //Skifter i modsat retning

    }

    if ((sin(vinkel) * (distanceFlyttet)  + positionY) > height ||
      (sin(vinkel) * (distanceFlyttet)  + positionY) < 0) { //Fluen bevæger sig indtil højden er nået

      speed *= -1;} //Skifter i modsat retning
  }

  void tegnFlue(float s){ //Fluen Tegnes
    pushMatrix();
      translate(positionX,positionY);
      scale(s);
      rotate(vinkel);
      translate(distanceFlyttet,0);
        ellipse(0,0,20,8);
        ellipse(0,0-8,15,10);
        ellipse(0,0+8,15,10);
        ellipse(0+6,0,8,8);
    popMatrix();
  } 
}
//////////////////////////////////////////////////////
