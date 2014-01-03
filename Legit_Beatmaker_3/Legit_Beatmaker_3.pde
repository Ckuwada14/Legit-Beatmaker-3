//Cameron Kuwada

#include <MeggyJrSimple.h>   

struct Point
{
  int x;
  int y;
};



Point s1 = {0,7};
Point s2 = {0,6};
Point s3 = {0,5};
Point s4 = {0,4};

Point t1 = {0,3};
Point t2 = {0,2};
Point t3 = {0,1};
Point t4 = {0,0};



Point topbarArray[64] = {s1, s2, s3, s4};  

Point bottombarArray[64] = {t1, t2, t3, t4};  

int score = 1; 

int marker = 4; 

int tempo = 188;

void setup()                    
{
  MeggyJrSimpleSetup();   
  Serial.begin(9600);
  
  
}






void drawtopbar()
{
  for (int i = 0; i < marker; i++)
  {
    DrawPx(topbarArray[i].x, topbarArray[i].y,Green);
  }
  DrawPx(topbarArray[0].x, topbarArray[0].y, Green);
}

void drawbottombar()
{
  for (int i = 0; i < marker; i++)
  {
    DrawPx(bottombarArray[i].x, bottombarArray[i].y,Green);
  }
  DrawPx(bottombarArray[0].x, bottombarArray[0].y, Green);
}




void loop()                     
{
  drawtopbar();
 drawbottombar();
  
  DisplaySlate();
  delay(tempo);
  ClearSlate();

  
  
  CheckButtonsPress();
 

  if (Button_A)
  
       score++;  
  
  if (Button_B)
  
       tempo+5;  
    
    
  
  
  if (score % 2 == 0)
 {
    topbarArray[0].x++;
    topbarArray[1].x++;
    topbarArray[2].x++;
    topbarArray[3].x++;
    
 }
  
  if (score % 2 > 0)
  {
    topbarArray[0].x = 0;
    topbarArray[1].x = 0;
    topbarArray[2].x = 0;
    topbarArray[3].x = 0;
     bottombarArray[0].x=0;
    bottombarArray[1].x=0;
    bottombarArray[2].x=0;
    bottombarArray[3].x=0;
   
  }
  

    
   
 
  

  
  if (topbarArray[0].x > 7)
 {
   topbarArray[0].x = 7;
    topbarArray[1].x = 7;
    topbarArray[2].x = 7;
    topbarArray[3].x = 7;
    bottombarArray[0].x++;
    bottombarArray[1].x++;
    bottombarArray[2].x++;
    bottombarArray[3].x++;
   
 }
if (bottombarArray[0].x > 7)
 { 
  score =1;
   
    bottombarArray[0].x = 0;
    bottombarArray[1].x = 0;
    bottombarArray[2].x = 0;
    bottombarArray[3].x = 0;
    
 }

DrawPx(7,6,Red);

DisplaySlate();

  if (ReadPx(topbarArray[1].x,topbarArray[1].y) == Red)   
  
  Tone_Start(ToneG3,70); 



}












