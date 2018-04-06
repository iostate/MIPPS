.data
# These numbers are in RAM
	number1: .word 5
	number2: .word 10
	number3: .word 15
.text
# In order to perform addition, these numbers in RAM have to be in the CPU
	lw $t0, number1($zero)
	lw $t1, number2($zero)
	lw $t2, number3($zero)
	
	add $t3, $t0, $t1 # t3 = t0 + t1
	add $t4, $t3, $t2 # t4 = t3 + t2
	
	# 1 is for loading words or integers
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	

