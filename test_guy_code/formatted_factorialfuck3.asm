# Factorial program using recursion
# Convert the variables to floating point
.data
	promptMessage:		.asciiz "Enter a number to find its factorial: "
	resultMessage: 		.ascii "\nThe factorial of the number is "
	theNumber: 		.float 0 
	theAnswer: 		.float 0
	myOne: 			.float 1.0
	
.text
	.globl main
	main:
		# Read the number from the user.
		li $v0, 4
		la $a0, promptMessage
		syscall
		
		# Load code for integer is 5
		# Load code for floating point is 6, also load it into
		# f register
		li $v0, 6
		syscall
		
		# s0 = v0
		move $s0, $v0
		
	    # s0 = USER INPUT 
        move $a0, $s0


        # a0 = USER input


        # CALL FUNCTION WITH The ARGUMENT LOADED
		
		# Call the factorial function

        # REDUNDANT
        # lw $a0, theNumber
		
		# Load it into the s0 register since it is preserved across calls
		# l.s $a0, (theNumber
		# s0 = theNumber
        # REDUNDANT
		# lw $s0, theNumber

         
		
		jal findFactorial
		l.s $f23, theAnswer
		
		# Display the results `
		li $v0, 4
		la $a0, resultMessage
		syscall
		
		li $v0, 1
		lw $a0, theAnswer
		syscall
		
		# Tell the OS that this is the end of the program
		li $v0, 10
		syscall
		
		
# ------------------------------------------------------------------

# findFactorial function
.globl findFactorial
findFactorial: 

	subu 	$sp, $sp, 8
	
	sw 	$ra, ($sp) # Store return address to the stack
	sw 	$s0, 4($sp) # Store the local variable to the stack 

	li $v0, 1
	beq $a0, 0, factorialDone
	
	# findFactorial(theNumber - 1)
	# mov.s $f0, $a0
	
	# Moving s0 into the argument a0
	move $s0, $a0
	sub $a0, $a0, 1
	jal findFactorial
	
	# Magic happens here
	mul $v0, $s0, $v0
		
	factorialDone:
	# Getting values back from the stack after the factorial is done
		lw $ra, ($sp)
		lw $s0, 4($sp)
		# Restore the stack .. undoes line 48
		addu $sp, $sp, 8
		
		# Return from the function 
		jr $ra