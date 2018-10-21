;Evaluating expression(X+Y+24H-Z) using byte data 


data SEGMENT
	X DB	11H
	Y DB	12H
	Z DB	30H
	res DB 	?
data ENDS

code SEGMENT
	ASSUME	CS:code DS:data
	
START:
	MOV AX,data
	MOV DS,AX
	MOV AL,X
	ADD AL,Y
	ADD AL,24H
	SUB AL,Z
	MOV res,AL
code ENDS
	END START	
		