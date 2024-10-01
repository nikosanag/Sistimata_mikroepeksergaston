.include "m16def.inc"

.def alpha = r16
.def beta = r17
.def zeta = r18
.def temp = r19
.def final = r23
.def normal = r25



.org 0 
jmp reset
.org 2
jmp handler
.org 4
jmp handler

reset:
sei
ser r27
out portd,r27
ldi r27,0x80
out gimsk,r27
ldi r27,12
out mcucr,r27
ldi r20,HIGH(RAMEND)
out SPH,r20
ldi r20,LOW(RAMEND)
out SPL,r20
clr r20
clr normal
ldi r21,8
out ddrc,r21
clr r21
out ddra,r21



main:
in temp,pina
andi temp,0x20
in alpha,pina
andi alpha,0x10
lsr temp

or alpha,temp
lsr alpha

in beta,pina
call helper

in zeta,pina
andi zeta,1
lsl zeta
lsl zeta 
lsl zeta

mov final,alpha
or final,beta
or final,zeta


call decide

out portc,final

jmp main


handler:
com normal
andi normal,1

reti

helper:
cpi beta,14
breq beta_one
clr beta
ret


beta_one:
ldi beta,8
ret

decide:
cpi normal,1
breq antistrofi
ret

antistrofi:
com final
ret