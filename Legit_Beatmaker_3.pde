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
nh


Point barArray[64] = {s1, s2, s3, s4};  



int score = 1;  

int marker = 4; 

void setup()                    
{
  MeggyJrSimpleSetup();   
  Serial.begin(9600);
}


void drawbar()
{
  for (int i = 0; i < marker; i++)
  {
    DrawPx(barArray[i].x, barArray[i].y,Green);
  }
  DrawPx(barArray[0].x, barArray[0].y, Green);
}





void loop()                     
{
  drawbar();
  
  DisplaySlate();
  delay(167);
  ClearSlate();

  
  
  CheckButtonsPress();
 

  if (Button_A)
  
       score++;  
    
  
  
  if (score % 2 == 0)
 {
    barArray[0].x++;
    barArray[1].x++;
    barArray[2].x++;
    barArray[3].x++;
 }
  
  if (score % 2 > 0)
  {
    barArray[0].x = 0;
    barArray[1].x = 0;
    barArray[2].x = 0;
    barArray[3].x = 0;
  }
  
  
  
//*
  
  if (barArray[0].x > 7)
 { 
    barArray[0].x = 0;
    barArray[1].x = 0;
    barArray[2].x = 0;
    barArray[3].x = 0;
 }
//*
 

}












