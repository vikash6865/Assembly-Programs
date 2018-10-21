; 32 bit unpacked to 16 bit packed

data segment
	unpacked dd 01020304H
	packed dw ?
data ends

code segment 
	ASSUME CS:code DS:data
START:
	MOV AX,data
	MOV DS,AX
	MOV AX,word ptr unpacked
	MOV BX,word ptr unpacked+2
	SHL AL,4
	SHR AX,4
	SHL BL,4
	SHR BX,4
	MOV byte ptr packed,AL
	MOV byte ptr packed+1,BL
code ENDS
	END START