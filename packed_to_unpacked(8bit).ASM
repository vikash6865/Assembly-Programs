; program to convert 8bit packed to unpacked

data segment
	digitpk db 89H
	digitunpk dw ?

data ENDS

code segment
	ASSUME CS:code DS:data
START:
	MOV AX,data
	MOV DS,AX
	MOV AX,0
	MOV AL,digitpk
	SHL AX,4
	SHR AL,4
	MOV digitunpk,AX
code ENDS
	END START
 