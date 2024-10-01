#include <stdio.h>
#include <avr/io.h>


// μεταφερονται τα 3 lsb απο το pind στα 3 msb του portb
unsigned char c;
void main()
{
	DDRB = 0xE0;
	DDRD = 0x00;



	while(1)
	{
		c = PIND;
		c = c<<5;
		PORTB = c;

	};
}


