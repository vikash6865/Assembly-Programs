data SEGMENT
	arr DB 23H,21H,19H,32H,67H
	s   DB 32H
	fout db "found$"          ;value to be printed when search is successful
    nout db "not found$"      ;value to be printed when search is unsuccessful
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
	JZ found
	LOOPNZ search
	JNZ notfound

not_found:                    ;control jumps here if element not found
        MOV DX, OFFSET nout
        MOV AH, 09H
        INT 21H
        HLT

found:                        ;control jumps here if element is found
	MOV DX, OFFSET fout
	MOV AH, 09H
	INT 21H
	HLT


code ENDS
	END START