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
		
		
		# So is my input getting put into v0? 

	#	lwc1 $f12, myOne

        
# The next few lines of code takes the input, and stores the input into t9.
# One is then subtracted from t9, and then the result is placed back into v0.
        
        
        # Move it into t9 from f0
        # Move it into a temporary register from a float register
		# t9 = input
		mov.s $f8, $f0 #C
		# t9 = t9 - 1 ...... Must do this for some weird reason
		sub.s $f8, $f8, $f13
		# v0 = f9   
		mov.s $f22, $f8

# The input, which was just been subtracted 1, is placed into the 
# factorial function

l.s $f22, theNumber
		
		
        
		# Call the factorial function
		lw $a0, theNumber
		
		# Load it into the s0 register since it is preserved across calls
		# l.s $a0, (theNumber
		# s0 = theNumber
		lw $s0, theNumber
		 
		
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

	# Gives us enough space to store two words
	subu 	$sp, $sp, 8
	
	# What is in the $ra register right before this function is called?
	
	# What is in the $s0 register right before this function is called?
	
	# Is it necessary to store the return address to the stack? 
	sw 	$ra, ($sp) # Store return address to the stack
	sw 	$s0, 4($sp) # Store the local variable to the stack 
	
	# Alright, so I have changed all the code to use and load floating point
	# numbers thus far. The code runs but it still gives me a 0 
	# as the result. 
	
	# This is because I have yet to change all the code to load floating
	# point numbers. I am going to watch a video about stacks in MIPS so that 
	# the piece of code above me annoy because I don't know what 
	# it's doing.  I believe it has something to do with the 
	
	# Base Case
	# ? If the argument is 0 then return 1
	
	# Load x into here.. ? 
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