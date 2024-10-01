#include <avr/io.h>
#include <stdio.h>


int is_moving(); 



unsigned char a,b,c;


int is_moving(unsigned char *point)
{
	if(*point!= 0x80 && *point != 0x01)
	{
		return 1;
	}
	else
	{
		return 0;
	}
	
}


void main()
{
	DDRC = 0x00;
	DDRA = 0x03;
	DDRB = 0xff;//0x80 is in basement 0x01 is first floor

	PORTB = 0x80;
	while(1)
	{
	
		if (is_moving(&PINB) == 1) //kineitai
		{
			if (PINA == 1)
			{ 
				PORTB = PORTB<<1;
			}
			else 
			{
				PORTB = PORTB>>1; 	
			}
	
		continue;
		}
		else //akinito
		{
		    //check for movement intiation
				PORTA = 0;
			
			if ((PINC == 0x12) || (PINC == 0x11) ||(PINC == 0x13))
			{
			  PORTA = 2; 
			  PORTB = PORTB>>1;
			}
			if((PINC == 0x0C)||(PINC == 0x09) || (PINC == 0x0f))
			{
				PORTA = 1;
				PORTB = PORTB<<1;
			}
		}
		
	
	};
	
	
	
	
}
