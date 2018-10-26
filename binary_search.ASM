;Assembly program to implement binary search
data segment
    arr db 23H, 34H, 47H, 49H,55H
    s db 47H
    beg dw 0
    mid dw ?
    last dw 5
    var db 02H
    out db "found","$"
    nout db "not found","$"
data ENDS

code segment
    ASSUME CS:code DS:data
START:
        MOV AX, data
        MOV DS, AX
        MOV BX, OFFSET arr
        MOV CX, 5
        MOV DL, s
        MOV DI, beg
        MOV SP, last

Address:
        MOV AX, beg
        ADD AX, last
        DIV var
        MOV SI, AX

Binary:
        CMP BX[SI], DL 
        JZ found
        JS upper
        JNS lower

upper:
        CMP beg, last
        JZ not_found
        MOV beg, SI
        JMP Address

lower:
        CMP beg, last
        JZ not_found
        MOV end, SI
        JMP Address

found:
        MOV DX, OFFSET out
        MOV AH, 09H
        INT 21H
        MOV AH, 4ch
        INT 21H

not_found:
        MOV DX, OFFSET nout
        MOV AH, 09H
        INT 21H
        MOV AH, 4ch
        INT 21H

code ENDS
        END START
