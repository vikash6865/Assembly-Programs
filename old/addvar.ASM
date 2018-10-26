data SEGMENT
    x   db    05H ;VAriable DEclartion
    y   db    04H
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

