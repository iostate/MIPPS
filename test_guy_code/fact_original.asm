      #--------------------------------------------------------
      # Name: Quan Truong
      # Date: 2/5/2018
      # Assignment: HW 2
      #
      #    Solves the factorial of a number recursively.
      #--------------------------------------------------------
.data
	promptMessage:		.asciiz "Enter a number to find its factorial: "
	resultMessage: 	.ascii "\nThe factorial of the number is "
	theNumber: 		.word 0 
	theAnswer: 		.word 0
	
.text
	.globl main
	main:
		# Read the number from the user.
		li $v0, 4
		la $a0, promptMessage
		syscall
		
		li $v0, 5
		syscall
		
		# Store the input into $v0
		sw $v0, theNumber
		
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