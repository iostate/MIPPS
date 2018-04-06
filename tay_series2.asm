.data
	xuser: .asciiz "Enter x (integer): "
	yuser: .asciiz "Enter y (integer): "
	result: .asciiz "X to the power Y is: "
	
.text

main: 

# Ask the user for the x input
	li $v0, 4
	la $a0, xuser
	syscall
	
# Enter the number? 
	li $v0, 5
	syscall
	
	# Move the x integer to t0
	move $t0, $v0
	li $at, 0 # Reset a ?
	li $v0, 0
	
# Ask the user for y input
	li $v0, 4
	la $a0, yuser
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0 # $t1 will be y
	li $at, 0
	li $v0, 0
	
	j pow
	
pow: 
	addi $t7, $t1, 0
	mul $v0, $t0, $t0
	addi $t7, $t7, -1
	bgt $t7, 1, pow
	
	bne $t1, $zero, pow_elif
	addi $v0, $v0, 1
	j pow_return
	
pow_elif:
	andi $t3, $t1, 1
	bne $t3, $zero, pow_else
	div $t1, $t1, 2
	jal pow
	mul $v0, $v0, $v0
	j pow_return
	
pow_else:
	addi $t1, $t1, -1
	jal pow
	mul $v0, $t0, $v0
	
pow_return:
	li $v0, 4
	la $a0, result
	
	li $v0, 1
	move $a0, $v0
	syscall
	
halt:
	j halt
	