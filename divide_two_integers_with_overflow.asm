# Divide two integers 
# Ability to print either the quotient or the remainder
.data
# No using RAM memory
.text
	addi $t0, $zero, 30
	addi $t1, $zero, 6

	# Division with overflow
	# Result will be stored in lo, remainder will be stored in hi	
	div $t0, $t1
	
	# Move the quotient (and/or) remainder to another register
	mflo $s0 # Quotient
	mfhi $s1 # Remainder 
	
	# Print the number 
	li $v0, 1
	
	# Print the quotient (and/or) remainder
	# Change 3rd parameter to s1 to print the remainder
	add $a0, $zero, $s0
	syscall

