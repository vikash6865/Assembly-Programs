;Program to add elements of double word array

data SEGMENT
    ARRAY DD 12345678H, 00004567H, 00004321H ;declaring and storing double word elements in in array 
    RES DD ?                                 ;declaring result variable
data ENDS

code SEGMENT
    ASSUME CS:code DS:data
START:
        MOV AX,data                          ;initializing data SEGMENT
        MOV DS,AX
        MOV SI, 0
        MOV CX, 3
        MOV AX, 0

addarray:
        ADD AX, word ptr ARRAY[SI]
        ADC DX, word ptr ARRAY[SI]+2
        ADD SI, 4
        LOOP addarray
        MOV word ptr RES, AX
      	MOV word ptr RES+2,DX
code ENDS
        END START