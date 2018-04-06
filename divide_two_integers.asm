# Division with integers
.data
# Not using RAM memory
.text
	# Add two numbers to CPU registers
	addi $t0, $zero, 30
	addi $t1, $zero, 5
	
	# Divide t0 by t1 and store the result into s0
	# t1 can be an integer, does not have to be t1
	# div $s0, $t0, $t1
	div $s0, $t0, 10
	
	# Print the result
	li $v0, 1
	# Add the result to a0
	add $a0, $zero, $s0
	syscall
