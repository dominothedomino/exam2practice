    .ORIG   x3000

; Name: Lonoehu Wacasey
; Date: 11/05/23

; Write a program in the LC-3 assembly language, starting at x3000, to find the sum of an array of 8-bit unsigned numbers. 
; The length of the array is at location x4000. The maximum length of this array is given to be 100 elements. 
; The array starts at x4002. Note that if the array length is zero, then the array is an empty array. 
; Each element of the array will be formatted in the following way:
; •	Bits [15:8] – 8-bit number that needs to be ignored. This should not be included in the sum. 
; •	Bits [7:0] – 8-bit number that needs to be included in the sum.
; The sum of the array elements must be stored in location x4001. If the array is an empty array, then store xFFFF at location x4001.


; BLOCK 1
; In this block the length of the array is loaded into a register.
; If the length is zero, then branch to BLOCK 3, and store xFFFF at location x4001.
; If the length is not zero, then move on to BLOCK 2.

LD R0, CNTRPTR
LDR R1, R0, #0  ;R1 is the counter number for how many elements needed to be added
BRZ NOELE
ADD R1, R1, #-1
BR  BLK2

CNTRPTR .FILL x4000
MASK2   .FILL x007F


; BLOCK 2
; In this block the sum of the 8-bit unsigned array elements is calculated.
; 

BLK2
    LD R0, MASK
    LD R2, BEGIN
    LDR R3, R2, #0
    AND R3, R3, R0
    AND R4, R4, #0
    ADD R4, R3, #0
    BR LOOP
    
LOOP
    ADD R1, R1, #0
    BRZ LOOPDONE
    ADD R2, R2, #1
    LDR R3, R2, #0
    AND R3, R0, R3
    ADD R4, R3, R4
    ADD R1, R1, #-1
    BR LOOP
    








MASK    .FILL x00FF
BEGIN   .FILL x4002

; BLOCK 3
; In this block the sum is stored at x4001.



NOELE
    LD R0, CNTRPTR
    LD R1, NONUM
    STR R1, R0, #1
    BR DONE

LOOPDONE
    LD R0, CNTRPTR
    STR R4, R0, #1
    BR DONE


DONE
    HALT
    
NONUM   .FILL   xFFFF






    .END