data SEGMENT
    arr db    01H,02H,03H,04H
    res db    ?
data ENDS

code SEGMENT
    ASSUME CS : code	DS : data
START:
      MOV AX  , data
      MOV DS  , AX
      MOV SI  ,	0
      MOV CX  , 4	  
      MOV BX  ,	OFFSET arr
      MOV AL  , 0
ADDARRAY:
      ADD AL  , BX[SI] 
      INC SI
      LOOP ADDARRAY
      MOV res , AL	
code ENDS
	END START
