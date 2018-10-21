;Evaluating expression(X+Y+24H-Z) assuming word data and performing calculation
;byte by byte

data SEGMENT
	X DW 1112H
	Y DW 2328H
	Z DW 1036H
	RES DW ?
data ENDS

code SEGMENT
	ASSUME CS:code DS:data

START:
	MOV AX,data
	MOV DS,AX
	MOV AL,BYTE PTR X
	MOV AH,BYTE PTR X+1
	ADD AL,BYTE PTR Y
	ADC AH,BYTE PTR Y+1
	ADD AL,24H
	ADC AH,00H
	SUB AL,BYTE PTR Z
	SBB AH,BYTE PTR Z+1
	MOV BYTE PTR RES,AL
	MOV BYTE PTR RES+1,AH 
code ENDS
	END START
	 


