.include "m16def.inc"

.def I=R16
.def K=R17
.def temp=R18
.def res=r19


.org 0
jmp begin
.org 0x04
jmp handler

begin:

ldi temp,0x00
out DDRD,temp
ldi temp,0x3E
out DDRA,temp


ldi temp,HIGH(RAMEND)
out SPH,temp
ldi temp,LOW(RAMEND)
out SPL,temp

ldi temp,0x80
out gimsk,temp
ldi temp,0x0C
out mcucr,temp
sei


clr temp
; PIND is input and porta is output(the specific bits of the excersise)



main:
ldi res,0
jmp main




input_one:
in I,PIND
andi I,0x07
ret
;done


input_two:
in K,PIND
lsr K
lsr K
lsr K
lsr K
lsr K
ret 



handler:
ldi r21,0x01
call input_one
call input_two
add I,K
ror I 
rol I
rol I 
out PORTA,I
reti


brains:
cpi I,0x01
breq monos
brlo not_monos
subi I,0x02
add res,r21

jmp brains




monos:
lsl res
lsl res
ori res,0x02
out PORTA,res
reti

not_monos:
lsl res
lsl res
out PORTA,res
reti