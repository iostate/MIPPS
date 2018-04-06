.data
promptxx: .asciiz "enter a number for X: "
prompty: .asciiz "enter a number for Y; "
x: 	.float 0.0
y:	 .word 0

.text
main:
li $v0, 4
la $a0, promptxx
syscall

li $v0, 5
syscall

# x = v0
sw $v0, x


li $v0, 4
la $a0, prompty
jal pow

li $v0, 10
syscall

pow:
#mul $v0, $v0, $a0
li $v0, 1
mul $v0, $v0, $v0
syscall




ble $a1, 0, pow0
subi $a1, $a1, 1
addi $sp, $sp, -4
sw $ra, 0($sp)
jal pow
lw $ra, 0($sp)
addi $sp, $sp, 4
move $v0, $t1
jr $ra

pow0:
move $v0, $t1
jr $ra
