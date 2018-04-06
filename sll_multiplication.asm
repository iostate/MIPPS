# Multiplication using sll (Shift Left Logical)
# Apparently this method is more efficient but not as flexible as mul or mult
.data
# Not using RAM
.text
	addi $s0, $zero, 2 # s0 = 2
	
	# Shift s0 to the left 6 times
	sll $t0, $s0, 6  # t0 = 128
	
	# Print the result
	li $v0, 1
	add $a0, $zero, $t0 # a0 = t0 = 2^(7) = 128
	syscall