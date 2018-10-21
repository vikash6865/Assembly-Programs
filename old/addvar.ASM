data SEGMENT
    x   db    03H
    y   db    02H
    res db    ?
data ENDS

code SEGMENT
    ASSUME CS : code	DS : data
START:
      MOV AX  , data
      MOV DS  , AX
      MOV AL  , x
      ADD AL  , y
      MOV res , AL
code ENDS
	END START

