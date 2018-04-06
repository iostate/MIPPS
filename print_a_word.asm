.data
	age: .word 23
.text
# The code to print an integer is 1
	li $v0, 1
	lw $a0, age
	syscall