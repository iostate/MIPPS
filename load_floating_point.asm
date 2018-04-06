.data
    x:      .float .5
    y:      .double  2.5
.text
	l.d     $f2, x          # $f0,$f1 ? x
	l.d     $f6, y          # $f1 ? y
	 
        # f4 = f6 / f2    
	div.d $f4, $f6, $f2
	
	# Branch if greater than 1
#        bgt $a0, 1, pow
#	move $v0, $a0
	
	 
#pow:
#	sub $sp, $sp, 12 # Store 3 registers to stack
#	sw $ra, 0($sp)
#	sw $a0, 4($sp)
#	sw $s1, 8($sp)
#	div.d $f8, $f6, $f2
	

	