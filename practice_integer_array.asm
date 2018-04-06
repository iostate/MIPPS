# Procesures (AKA functions)
.data
	list: .word 3, 0, 1, 2, 6, -2, 4, 7, 3, 7
.text
	# Load the address of the list
	la $t3, list
	li $t2, 0 # Which index is this putting into t2?
	add $t2, $t2, $t2 
	add $t2, $t2, $t2
	add $t1, $t2, $t3
	lw $t4, 0($t1)
	
	
	