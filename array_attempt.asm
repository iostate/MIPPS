
.data
    thearray: .word 1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31
	.word 33,35,37,39,41,43,45,47,49,51,53,55,57,59,61,63
	.word 65,67,69,71,73,75,77,79,81,83,85,87,89,91,93,95
	.word 97,99,101,103,105,107,109,111,113,115,117,119,121,123,125,127
 passmsg: .asciiz "The test passed!"
failmsg: .asciiz "The test failed!"

.text
	# Variables
	# t0 = i
    	# v0 = sum
    	# t2 = array of elements
    	# t3 = address of array elements
    	# t4 = stop loop at this number
    	
    	addi $t1, $0, 0 # Counter
    	addi $v0, $0, 0 # Sum
    	addi $t4, $0, 127 # Stop Condition
    	la $t2, thearray
    	
    	loop:
    	add $t0, $t2, $t1
    	lw $t3, 0($t0) # t3 = first element of the array
    	addu $v0, $t3, $v0
    	addi $t1, $t1, 4
    
 	bne $t3, $t4, loop

compare:

	addi $t3, $zero, 0x1000 # t3 = 0x1000
	la	 $a0, failmsg
	bne	 $t3, $v0, printmsg
	la	 $a0, passmsg

printmsg:
	addi	$v0, $zero, 55
	syscall

halt:	j	halt
