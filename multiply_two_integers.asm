# Multiply two integers together using mul
# NO data in RAM
.data
# Not using any data from RAM
.text
# To not use any data from RAM, must load data into CPU register directly by using addi
	addi $s0, $zero, 10 # s0 = 10
	addi $s1, $zero, 4  # s1 = 4
	
	mul $t0, $s0, $s1 # t0 = 10 * 4
	
	# Print an integer to the screen
	li $v0, 1
	add $a0, $zero, $t0 # a0 = 40
	syscall