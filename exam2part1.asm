    .ORIG   x3000

; FILL OUT YOUR NAME AND DATE BELOW.
; Name: Lonoehu Wacasey
; Date: 11/05/24

; EXAM 2 PART 1 [20 points]: Write a program in the LC-3 assembly language, starting at x3000, to find the length of a null-terminated array 
; of 16-bit positive numbers. 
; 
; The array starts at x4000. Note that the array can be empty, in which case the length will be zero, and
; the null sentinel will be at x4000.
; 
; This program must store the length at x3FFF.
;
;
; EXTRA-CREDIT [5 points]: Find the number of even numbers in the array (note that the sentinel is not an element of the array, and 
; therefore should not be considered as an even number in the array). Store the number of even numbers at x3FFE.
; 
; YOUR PROGRAM MUST NOT CHANGE THE ARRAY IN ANY WAY. IN OTHER WORDS, THE ARRAY MUST REMAIN INTACT.
;

; BLOCK 1
; In this block load the starting address of the array in some register, say R0. 
; Clear another register, say R1, which will hold the length of the array. 
; You can use other registers for these purposes. R0 and R1 are merely suggestions.
; 
LD R0, PTR
LDR R1, R0, #0
BRZ NOLENGTH
AND R1, R1, #0
LD R5, EVENMASK
AND R6, R6, #0
AND R4, R4, #0
BR COUNTER



PTR .FILL x4000

; BLOCK 2
; In this block find the length of the array.
; If you are attempting the extra-credit, then find the number of even numbers in the array.
; 


COUNTER
    LDR R1, R0, #0
    BRZ STORE
    ADD R6, R6, #1
    AND R3, R1, R5
    BRP RESETCOUNTER
    BR EVEN
    
EVEN
    ADD R1, R1, #0
    BRZ RESETCOUNTER
    ADD R4, R4, #1
    BR RESETCOUNTER
    
RESETCOUNTER
    ADD R0, R0, #1
    AND R3, R3, #0
    BR COUNTER
    
    








EVENMASK    .FILL x0001


; BLOCK 3
; In this block store the length at x3FFF. 
; Branch to DONE, if you are not attempting the extra credit in BLOCK 4.
; 
NOLENGTH
    AND R6, R6, #0
    BR STORE

STORE
    LD R7, NUMPTR
    STR R6, R7, #0
    STR R4, R7, #-1
    BR DONE


NUMPTR  .FILL x3FFF









; BLOCK 4
; In this block store the number of even numbers at x3FFE.






DONE HALT


    







    .END