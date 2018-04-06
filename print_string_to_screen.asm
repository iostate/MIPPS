.data
	myMessage: .asciiz "hello world \n"

.text
# load 4 into $v0 to let the pc know that we want to print something to screen
	li $v0, 4
	# load myMessage from RAM into $a0
	la $a0, myMessage
	# tell the computer to go ahead and do the instructions
	syscall
