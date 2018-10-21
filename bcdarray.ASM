data SEGMENT
	arr DW 01H,02H,03H,04H,05H
	res DW ?
data ENDS

code SEGMENT
	ASSUME DS:data CS:code
START:
	MOV AX,data
	MOV DS,AX
	MOV BX,OFFSET arr
	MOV SI,0
	MOV CX,5
	MOV AX,0
bcdarray:
	ADD AX,BX[SI+1]
	DAA
	INC SI
	LOOP bcdarray
	MOV res,AX
code ENDS
	END START