data SEGMENT
	arr DB 23H,21H,19H,32H,67H
	s   DB 32H
data ENDS

code SEGMENT
	ASSUME CS:code DS:data
START:
	MOV AX,data
	MOV DS,AX
	MOV CX,5
	MOV BX,OFFSET arr
	MOV SI,-1
	MOV DL,s
search:
	INC SI
	CMP BX[SI],DL
	LOOPNZ search	
code ENDS
	END START