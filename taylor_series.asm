.data
	a: .float 1.0
	b: .float 10.0
	c: .float 2.0

.text
	# Variables
	# t0 = i
	# t1 = sum
	# t2 = stop condition
	
	
	#add $t0, $0, $0 # Initialize the counter to 0
	#add $t1, $0, $0
	#add $t2, $0, 10
	
	# la $a0,($t2)
	
	
	l.s $f0, b
	l.s $f1, c
	# Store $f2 * 2 into $f1
	mul.s $f3, $f0, $f1
	#li $v0, 4
	#la $a0, $v0
	#syscall
	