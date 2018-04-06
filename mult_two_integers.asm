# Multiplication using mult
.data
# Not using any values in RAM
.text
# Store values in registers instead of using values from RAM
	addi $t0, $zero, 2000 # t0 = 2000
	addi $t1, $zero, 10   # t1 = 10
	
	mult $t0, $t1
	
	# Move the product of the above statement into s0
	mflo $s0
	
	# Display product to screen
	li $v0, 1

	add $a0, $zero, $s0
	syscall
