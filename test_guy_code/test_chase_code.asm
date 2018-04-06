# Chase Allen
# 2/7/18
# Assignment HW 2 part 2

.text
main: 

	

findFactorial:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	
	li $t0, 1
	mtc1 $t0, $f4
	mtc1 $a0, $f0
	li $v0, 1
	beq $a0, 0, result
	
	mfc1 $s0, $f0
	mov.s $f2, $f0
	sub.s $f0, $f0, $f4
	jal findFactorial
	
	mul.s $f4, $f2, $f4
	mfc1 $v0 $f4
	
result:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addi $sp, $sp, 8
	jr $ra
	
	
	
