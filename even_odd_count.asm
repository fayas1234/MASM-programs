ASSUME CS:CODE, DS:DATA
DATA SEGMENT
NUMBERS DW 1234H, 5678H, 9ABCH, 0EF0H, 524AH, 9751H, 7623H, 9090H, 0ABBH, 0EFBH
COUNT EQU 10D
EVEN_COUNT DW 01H DUP(?)
ODD_COUNT DW 01H DUP(?)

DATA ENDS

CODE SEGMENT
START:
	MOV AX, DATA
	MOV DS, AX
	
	MOV CX, COUNT
	XOR AX, AX
	
	MOV SI, OFFSET NUMBERS
	
	XOR BX,BX
	XOR DX,DX
	
COUNT_LOOP:
	MOV AX,[SI]
	ROR AX,01
	JC ODD
	INC BX
	JMP SKIP
	
ODD:
	INC DX
SKIP:
	ADD SI,02
	LOOP COUNT_LOOP
	
	MOV DI, OFFSET EVEN_COUNT 
	MOV [DI],BX ;MOVING COUNT OF EVEN NO: TO LOCATION EVEN_COUNT
	
	MOV DI, OFFSET ODD_COUNT
	MOV [DI],DX ;MOVING COUNT OF ODD NO: TO LOCATION ODD_COUNT
	
	MOV AH,4CH
	INT 21H
	
CODE ENDS
END START
