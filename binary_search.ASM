;Assembly program to implement binary search
data segment
    arr db 23H, 34H, 47H, 49H,55H ;declaring byte array of size 5 bytes
    srch db 55H                  ;variable to hold search value
    beg dw 0                  ;variable to hold begining index of array arr
    mid dw ?                  ;variable to hold middle index of array arr
    last dw 5                 ;variable to hold last index of array arr
    var db 02H
    fout db "found$"          ;value to be printed when search is successful
    nout db "not found$"      ;value to be printed when search is unsuccessful
data ENDS

code segment
    ASSUME CS:code DS:data
START:
        MOV AX, data		      ;initializing data segment
        MOV DS, AX            ;initializing data segment
        MOV BX, OFFSET arr    ;loading offset address of array in base register
        MOV DL, srch          ;loading search element value in DL register
        MOV CX, beg           ;loading begining index of array in CX register
        MOV DI, last          ;loading last index of array in DI register

Address:                      ;control jumps here to calculate mid index of array
        MOV AX, CX
        ADD AX, DI
        DIV var
      	MOV AH, 00H
        MOV SI, AX

Binary:                       ;compares search element with mid index of array arr
        CMP BX[SI], DL
        JZ found
        JS upper
        JNS lower

upper:                        ;this is the upper half of the array if mid value is smaller than search element
        MOV CX, SI
        CMP CX, DI
        JZ not_found
        JMP Address

lower:                        ;this is the lower half of the array if mid value is greater than search element
        MOV DI, SI
        CMP CX, DI
        JZ not_found
        JMP Address


not_found:                    ;control jumps here if element not found
        MOV DX, OFFSET nout
        MOV AH, 09H
        INT 21H
        HLT

found:                        ;control jumps here if element is found
        MOV DX, OFFSET fout
        MOV AH, 09H
        INT 21H
code ENDS
        END START