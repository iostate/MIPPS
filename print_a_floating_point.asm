# Print a floating point number
.data
	PI: .float 3.14
.text
# The code to print a floating point number is 2
	li   $v0, 2
# Must load the value into $f12 for a floating point number
# $f12 is in coprocessor 1
	lwc1 $f12, PI
	syscall
	