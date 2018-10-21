;Evaluating expression(X+Y+24H-Z) assuming word data 


data SEGMENT
	X DW	0211H
	Y DW	1112H
	Z DW	3430H
	res DW 	?
data ENDS

code SEGMENT
	ASSUME	CS:code DS:data
	
START:
	MOV AX,data
	MOV DS,AX
	MOV AX,X
	ADD AX,Y
	ADD AX,24H
	SUB AX,Z
	MOV res,AX
code ENDS
	END START	
		