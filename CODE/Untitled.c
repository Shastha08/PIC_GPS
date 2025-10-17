#include<pic.h>
#define _XTAL_FREQ 20000000
__CONFIG(0X3F3A);
void lcd(char a,int b)
{
 PORTB=a;
  RC0=b;
  RC1=1;
__delay_ms(30);
 RC1=0;
__delay_ms(30);
}

void wait(char c)
{
	char c1;
   do{
    while(RCIF==0);
   RCIF=0;
  c1=RCREG;
 }while(c1!=c);
}

void main()
{
int i;
char c;
char LATITUDE[20];
char LONGITUDE[20];
char arr1[]="LATITUDE";
char arr2[]="LONGITUDE";
char arr3[]="END WITH ,";
 TRISD0=0;
 TRISD1=0;
 TRISC0=0;
 TRISC1=0;

  TRISB=0X00;
 RD0=0;
 TXSTA=0b00100100;
 RCSTA=0b10010000;
 SPBRG=129;
 lcd(0X0E,0);
  lcd(0X38,0);


  wait('G');


 wait('P');


 wait('R');


 wait('M');


 wait('C');

 
 wait(',');


 wait(',');


 wait('A');
 
  RD0=1;


 wait(',');




for(i=0;;i++)
{
  while(RCIF==0);
RCIF=0;
c=RCREG;
if(c==',')
{
 break;
}
 LATITUDE[i]=c;
} 


  wait('N');


   wait(',');

  RD1=1;



for(i=0;;i++)
{
  while(RCIF==0);
RCIF=0;
c=RCREG;
if(c==',')
{
 break;
}
  LONGITUDE[i]=c;
}

 lcd(0x01,0);
for(i=0;i<10;i++)
{
  lcd(0x80+i,0); 
  lcd(LATITUDE[i],1);
}
lcd(' ',1);
lcd('L',1);
lcd('A',1);
lcd('T',1);
for(i=0;i<10;i++)
{
  lcd(0xc0+i,0); 
  lcd(LONGITUDE[i],1);
}
lcd(' ',1);
lcd('L',1);
lcd('O',1);
lcd('N',1);



while(1){
  RD0=1;
}   

  
}