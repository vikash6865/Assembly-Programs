;program to store 5 words from 50 bytes of segment and storing 2's complement of array from 60th bytes

data segment
    blank db dup(?)
    array dw 1111H,1122H,1133H,1144H,1155H
    STCMP dw 5 dup(?)
data ends

code segment
    ASSUME CS:code DS:data
START :
        MOV AX, data
        MOV DS, AX

        MOV CX,5
        MOV SI,0

STOCOMP :
        MOV AX, array[SI]
        NOT AX
        ADD AX, 1
        MOV STCMP[SI], AX
        ADD SI, 2
        LOOP STOCOMP
code ends
        end START
