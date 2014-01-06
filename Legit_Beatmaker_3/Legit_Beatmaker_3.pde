//Cameron Kuwada
#include <MeggyJrSimple.h>   


//instructions: When turned on, screen will be blank. Press A to play loop. 
//Press B once, to bring up a cursor, this switches the game to setup mode
//Move the cursor around and press A to place dots.
//THen press B again to switch back to play mode.
//In play mode, left and right adjust tempo.






struct Point
{
  int x;
  int y;
};



Point s1 = {-1,7};
Point s2 = {-1,6};
Point s3 = {-1,5};
Point s4 = {-1,4};




Point topbarArray[64] = {s1, s2, s3, s4};  

boolean showcursor = false;

int notex = 0;
 
int notey = 0;

int cursorx = 4;

int cursory = 4;

int score = 1; 

int marker = 4; 

int tempo = 200;

int bar = 1;

int Choice =3;


void setup()                    
{
  MeggyJrSimpleSetup();   
  Serial.begin(9600);
  
for (int i = 0; i < 8; i++)
  DrawPx(i,7,Yellow);
  
for (int i = 0; i < 8; i++)
  DrawPx(i,3,Yellow);
  
 
}






void drawtopbar()
{
  for (int i = 0; i < marker; i++)
  {
    
  }
  DrawPx(topbarArray[0].x, topbarArray[0].y, Green);
 
  
}



void loop()                     
{
  drawtopbar();

  
  DisplaySlate();
  
  delay(tempo);

  
  
  CheckButtonsPress();
 

  if (Button_A)
  {
    if (Choice % 2 > 0)
     {  
       score++; 
       showcursor= false;

     }
       
    if (Choice %2 == 0)
    showcursor= true;
    
    
  }
  
  if (Button_B)
 { 
  
  
       Choice++;  
  } 
    
  if (Button_Up)
  {
    
   cursory++;
   showcursor= false;
    DrawPx(cursorx,cursory-1,Dark);
  }

  if (Button_Right)
  {
     if (Choice % 2 > 0)
    tempo-=20;
   if (Choice % 2 == 0)  
   
   cursorx++;
   showcursor= false;  
   DrawPx(cursorx-1,cursory,Dark); 
  }
  if (Button_Down)
  {
   cursory--;
   showcursor= false; 
  DrawPx(cursorx,cursory+1,Dark); 
  }
  if (Button_Left)
  {
    if (Choice % 2 > 0)
    tempo+=20;
   if (Choice % 2 == 0)  
   cursorx--;
   showcursor= false;   
   DrawPx(cursorx+1,cursory,Dark);
  }  
  
  
  if (score % 2 == 0)
 {
    topbarArray[0].x++;
    DrawPx(topbarArray[0].x-1,topbarArray[0].y,Yellow);
    
   
    
 }
  

  

    
  
  
  if (topbarArray[0].x >7)
 {
 bar ++;
  topbarArray[0].x = 0;
 
 }
 
if (bar % 2 == 0)
{
  

 
    topbarArray[0].y = 3;
    
 }
 
 if (bar % 2 > 0)
{
  

 
    topbarArray[0].y = 7;
  
    
 }
 
 
   if (score % 2 > 0)
  {
    bar = 1;
    topbarArray[0].x = -1;
   
    
    topbarArray[0].y = 7;
   
     
  }



DisplaySlate();



if (Choice % 2 == 0)

{
  DrawPx(cursorx,cursory,Blue);
  DisplaySlate();
  
}

if (Choice % 2 > 0)

{
  
  DrawPx(cursorx,cursory,Dark);
  DisplaySlate();
  
}


if (showcursor == true)
{
   notex = cursorx;
   notey = cursory;
  DrawPx(notex,notey-1,Red);
  DisplaySlate();
  
}

if (showcursor == false)
{
  notex != cursorx;
   notey != cursory;
   DrawPx(notex,notey-1,Red);
  DisplaySlate();
  
  
  if (ReadPx(topbarArray[0].x,6) == Red)   
  
  {
    if (topbarArray[0].y == 7) 

   Tone_Start(ToneDs5,30); 
  }
  
if (ReadPx(topbarArray[0].x,5) == Red)  

  {
    
    if (topbarArray[0].y == 7) 

  Tone_Start(ToneDs9,40);
  }

if (ReadPx(topbarArray[0].x,4) == Red)  

 {
   
    if (topbarArray[0].y == 7) 

  Tone_Start(ToneB2,70);

}
 
  if (ReadPx(topbarArray[0].x,2) == Red)   
  
  {
    if (topbarArray[0].y == 3) 

   Tone_Start(ToneDs5,30); 
  }
  
if (ReadPx(topbarArray[0].x,1) == Red)  

  {
    
    if (topbarArray[0].y == 3) 

  Tone_Start(ToneDs9,40);
  }

if (ReadPx(topbarArray[0].x,0) == Red)  

 {
   
    if (topbarArray[0].y == 3) 

  Tone_Start(ToneB2,70);

}
}
}

 




