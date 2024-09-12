.include "m16def.inc"

.def A=R16
.def B=R17
.def C=R18
.def D=R19
.def temp1=R20
.def temp2=R21

; i will set the stack pointer to the end of sram
ldi A,HIGH(RAMEND)
OUT SPH,A
ldi A,LOW(RAMEND)
OUT SPL,A


clr R22
out DDRB,R22
ser R22
out ddrc,R22
clr R22
clr r24
rcall loopa
loopa:

ldi A,1
ldi B,2 
ldi C,4 
ldi D,8
in r23,PINB
and A,r23
and B,r23
lsr B 
and C,r23
lsr C
lsr C
and D,r23
lsr D
lsr D 
lsr D
call first
call second

or r24,temp1
out PORTC,r24
jmp loopa

first: 
mov temp1,B
com temp1
and temp1,A
andi temp1,1

mov temp2,B
and temp2,D


mov r24,temp1
or r24,temp2
ret

second:

mov temp1,A
com temp1
com C
or temp1,C
com C
andi temp1,1

mov temp2,D
com B
or temp2,B
com B

and temp1,temp2
lsl temp1
ret

