# Factorial program using recursion
# Convert the variables to floating point
.data
	promptMessage:		.asciiz "Enter a number to find its factorial: "
	resultMessage: 	.ascii "\nThe factorial of the number is "
	theNumber: 		.float 0 
	theAnswer: 		.word 0
	myZero:			.float 0
	
.text
	.globl main
	main:

		# Read the number from the user.
		li $v0, 4
		la $a0, promptMessage
		syscall
		
		# Load code for integer is 5
		# Load code for floating point is 6
		li $v0, 6
		syscall
		
		# Print the number that was received as input
		li $v0, 2
		mov.s $f12, $f0
		syscall
		
		
		
		
		# 0x40800000 should be in $f3
		# theNumber = v0
		# f0 = input 
		
		# f9 = input
	#	mov.s $f9, $f0
		
		
		sw $v0, $f0
		
		# sw $v0, theNumber
        
		# Call the factorial function
		
		
		
		lw $a0, theNumber
		jal findFactorial
		sw $v0, theAnswer
		
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

	# Gives us enough space to store two words
	subu 	$sp, $sp, 8
	sw 	$ra, ($sp) # Store return address to the stack
	sw 	$s0, 4($sp) # Store the local variable to the stack 
	
	# Base Case
	# ? If the argument is 0 then return 1
	li $v0, 1
	beq $a0, 0, factorialDone
	
	# findFactorial(theNumber - 1)
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