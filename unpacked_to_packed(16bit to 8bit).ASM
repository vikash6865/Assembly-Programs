; 16 bit unpacked to 8 bit packed

data segment
	unpacked dw 0204H
	packed db ?
data ends

code segment 
	ASSUME CS:code DS:data
START:
	MOV AX,data
	MOV DS,AX
	MOV AX,unpacked
	SHL AL,4
	SHR AX,4
	MOV packed,AL
code ENDS
	END START