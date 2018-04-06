.data
	myOne: .float 1.0 # Used at line 13
	myZero: .float 0.0 # Used at line 16
.text

pow:
	addi $sp,$sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	
	
	li $t0, myOne
	li $t5, myZero
	# l.d $f0, myOne
	# l.d $f1, myZero
	mtc1 $a0, $f3

	bne $a1, $zero, pow_elif
	mfc1 $v0, $f0
	bne $a0, $zero, pow_elif
	mfc1 $v0, $f0
	j pow_return

pow_elif:
	andi $t0, $a1, 1
	bne $t0, $zero, pow_else
	srl $a1, $a1, 1
	mul.s $f3, $f3, $f3
	j pow_return

pow_else:
	addi $a1, $a1, -1
	mtc1 $a0, $f4
	jal pow
	mul.s $f3, $f4, $f3

pow_return:
	mfc1 $v0, $f3
	lw $s1, 8($sp)
	lw $s0, 4($sp)
	lw $ra, 0($sp)
	addi $sp, $sp, 12
	jr $ra
