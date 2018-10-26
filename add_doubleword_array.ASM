;Program to add elements of double word array

data SEGMENT
    ARRAY DD 12345678H, 00004567H, 00004321H
    RES DD ?
data ENDS

code SEGMENT
    ASSUME CS:code DS:data
START:
        MOV AX,data
        MOV DS,AX
        