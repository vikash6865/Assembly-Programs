; program to convert 16bit packed to unpacked

data segment
	digitpk dw 8912H
	digitunpk dd ?

data ENDS

code segment
	ASSUME CS:code DS:data
START:
	MOV AX,data
	MOV DS,AX
	MOV AX,0
	MOV AL,byte ptr digitpk
	MOV BL,byte ptr digitpk+1
	SHL AX,4
	SHR AL,4
	SHL BX,4
	SHR BL,4
	MOV word ptr digitunpk,AX
	MOV word ptr digitunpk+1,BX
code ENDS
	END START
 