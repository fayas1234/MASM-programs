;program to perform string reversal palindrome

ASSUME CS:CODE,DS:DATA

DATA SEGMENT 
	STR1 DB "malayalam$"
	MSG1 DB "Palindrome $"
	MSG2 DB "Not a Palindrome $"
DATA ENDS

CODE SEGMENT
START:
	MOV AX,DATA
	MOV DS,AX
	
	MOV CL,LENGTH STR1
	
	LEA SI,STR1
	LEA DI,STR1
	
	MOV AL,'$'
	
	L1:
		CMP AL,[SI]
		JZ NEXT
		
		INC SI
		
		JMP L1
	
	NEXT: 
		DEC SI
		
	PAL:
		MOV AH,[DI]
		
		CMP [SI],AH
		JNZ EXIT
		
		DEC SI
		INC DI
		
		DEC CL
		JNZ PAL
		
		LEA DX,MSG1
		MOV AH,09H
		INT 21H
		
		MOV AH,4CH
		INT 21H
		
	EXIT:
		LEA DX,MSG2
		MOV AH,09H
		INT 21H
		
		MOV AH,4CH
		INT 21H
CODE ENDS
END START		
		

	
