data SEGMENT
  x   db  05h
  y   db  03h
  z   db  02h
  res db  ?
data ENDS

code SEGMENT
  ASSUME CS:code  DS:data
START:
      MOV AX,data
      MOV DS,AX
      MOV AL,x
      ADD AL,y
      ADC AL,24
      SUB AL,z
      MOV res,AL
code ENDS
END START
