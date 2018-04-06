# Stack Registers

.data
	newLine: .asciiz "\n"
.text

	main: 
		# s0 = 10
		addi $s0, $zero, 10
		
		jal increaseMyRegister
		
		# Print s0
		li $v0, 1
		move $a0, $s0
		syscall
		
		# Signal end of program
		li $v0, 10
		syscall
		
	increaseMyRegister:
	
		# Add enough space for one word
		addi $sp, $sp, -4
		# First position in stack is now equal to s0
		
		# Why can't we access s0 directly, without putting it on
		# the stack?
		sw $s0, 0($sp)
		
		# Now we can play around with s0, for instance, decrementing it
		# We can also pull back the original value by calling on the stack again.
		# Do I need to undo the space allocated for the one word 
		# after the pop from stack? 
		
		
		# Random add operation to show that we can 
		# play around with s0, and still pull back the original
		# value from the stack
		
		# Add s0 = 40
		addi $s0, $s0, 30
		
		# Print the new value
		li $v0, 1
		move $a0, $s0
		syscall 
		
		# s0 = 10
		# Replace the old value before going back to main
		lw $s0, 0($sp)
		addi $sp, $sp, 4 # Undo the stack
		 
		jr $ra
		
		
	