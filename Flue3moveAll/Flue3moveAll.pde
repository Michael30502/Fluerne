ArrayList<Flue> flueListe = new ArrayList<Flue>();
float flySize;
float placementX =0;
float placementY = 0;
void setup(){
  size(500,500);
  flySize = 1;
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
    distanceFlyttet = distanceFlyttet + 1;
   
        placementX = ((distanceFlyttet *(sin((PI-PI/2-vinkel))/sin(radians(90)))));
        placementY = sqrt((placementX*placementX)+(distanceFlyttet*distanceFlyttet)-2*placementX*distanceFlyttet*cos(vinkel));
        if (vinkel > PI )
        placementY = -placementY;
     
    if(placementX+positionX > 495){

    if(vinkel >3)
    vinkel -= PI/3;
    else
    vinkel+= PI/3;
     positionX = placementX+positionX-7;
  
    positionY = placementY+positionY;
   
   
     distanceFlyttet = 0;
  }
  if(placementX+positionX < 5){
    if(vinkel <PI)
    vinkel -= PI/2;
    else
    vinkel+= PI/2;
    positionX = placementX+positionX+7;
    positionY = placementY+positionY;
distanceFlyttet = 0;
  }

   if(placementY+positionY > 495){
 
          if(PI/2< vinkel)
     vinkel +=PI/2;
     else
     vinkel -=PI/2;
         positionX = placementX+positionX;
     positionY = placementY+positionY-7;
     distanceFlyttet = 0;
   } 
   
   if(placementY+positionY < 5){
   
     if(PI*1.5 <vinkel)
     vinkel +=PI/2;
     else
     vinkel -=PI/2;
         positionX = placementX+positionX;
     positionY = placementY+positionY+7;
     distanceFlyttet = 0;
   }
  
       if(vinkel<0)
     vinkel = 2*PI+vinkel;
     if(vinkel> 2*PI)
     vinkel -= 2*PI;
  
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
