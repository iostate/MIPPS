.data
	xint: .asciiz "Integer x: "
	yint: .aciiz "Integer y: " 
	result: .asciiz "X to the power Y is: " 
	
.text

main: 

# Load the x integer into a0
	li $v0, 4 # Prepare to print an asciiz (word)
	la $a0, xint # Load the x prompt into a0
	syscall
	
	# Ask for the x double 
	li $v0, 5
	syscall
	
	# Move the number for x into t0
	move $t0, $v0
	li $at, 0 # Reset the assembly temporary register
	li $v0, 0 # Reset v0
	
	li $v0, 4 # Prepare to print an asciiz (word)
	la $a0, yint # Load the y prompt into a0
	syscall
	
	# Ask for the y double
	li $v0, 5 
	syscall
	
	# Move the y value from v0 to t1
	move $t1, $v0
	li $at, 0 # Reset the assembly temporary register
	li $v0, 0 # Reset v0
	
	j pow # Begin the recursion
	
pow:

	# t7 = y + 0 
	addi $t7, $t1, 0
	
	# v0 = x * x 
	mul $v0, $t0, $t0
	
	# y - 1
	addi $t7, $t7, -1
	
	# If y is greater than 1, reiterate through pow
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
	syscall
	
	li $v0, 1
	move $a0, $v0
	syscall
	
halt: 
	j halt