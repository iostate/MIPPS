.data
	myDouble: 	.double 7.202
	zeroDouble: 	.double 1.0
	
.text
# Load myDouble into Coproccessor 1: $f2
	ldc1  $f2, myDouble
# Load zeroDouble into Coprocessor 1: $f0
	ldc1 $f0, zeroDouble
	
# Prepare the return register, load value 3 into it.. QUESTION: What does 3 do?
	li $v0, 3
# Add $f2 and $f0 and load it into $f12, which is a floating point register
	add.d $f12, $f2, $f0
	syscall