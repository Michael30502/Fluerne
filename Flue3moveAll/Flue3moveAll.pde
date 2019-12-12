ArrayList<Flue> flueListe = new ArrayList<Flue>();
float flySize;
void setup(){
  size(500,500);
  flySize = 0;
}

void draw(){
  
  background(100);
  //kalder funktioner tegner og flytter alle fluerne
  for(int i=0; i<flueListe.size(); i++){
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.flyt();
  }
  text("Flue Størrelse " + flySize,400,400);
  
  
}

void keyPressed(){
  //tilføjer en flue til arraylisten
  if(keyCode == UP)
  flySize += 1;
  else if (keyCode == DOWN)
  flySize -=1;
  else
  switch(key){
  case 'e':    flueListe.add(new Flue(flySize*10)); break;
  case 'o':  {     int size = flueListe.size();
    for(int i=0; i<size; i++)
    flueListe.remove(0);} break;
case 'p': {
    if(flueListe.size() != 0)
    flueListe.remove(flueListe.size()-1);
    } break;
    
    default: flueListe.add(new Flue(flySize));
  }}

void mousePressed(){
  //tilføjer en flue til arraylisten på muse kordinaterne
  flueListe.add(new Flue(mouseX, mouseY,flySize));
}

/////////////////////////////////////////////////////////
class Flue{
  //Laver variabler der husker/definere positionen til fluen, distancen fluen bliver flyttet hver frame, og vinkel fluen har
  float positionX,positionY;
  float distanceFlyttet;
  float vinkel = 0; 
  float flueSizeScale;
  
      //Konsturere Instansen af fluen 
  Flue(float c){
    positionX  = random(0,height);
    positionY  = random(0,width);
    vinkel     = random(0,2*PI);
    flueSizeScale = c;
  }
      //Konsturere Instansen af fluen 
  Flue(float a, float b, float c){

    positionX = a;
    positionY = b;
    vinkel    = random(0,2*PI);
    flueSizeScale = c;
  }
  
  void flyt(){
    //Fluen bliver flyttet
    distanceFlyttet = distanceFlyttet + 0.5;
    text(distanceFlyttet,positionX,positionY);
    if(distanceFlyttet +positionX > 500)
vinkel -= PI/2;
  }

  void tegnFlue(){
    //Gemmer koordinatsystemet, laver ændringer til det, og loader det gamle koordinat system igen når det er færdig med at tegne
    pushMatrix();

      translate(positionX,positionY);
      rotate(vinkel);
      translate(distanceFlyttet,0);
          scale(1+flueSizeScale/10);
        ellipse(0,0,20,8);
        ellipse(0,0-8,15,10);
        ellipse(0,0+8,15,10);
        ellipse(0+6,0,8,8);
    popMatrix();
  } 
  
}
//////////////////////////////////////////////////////
