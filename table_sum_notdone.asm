.data
thearray: .word 1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31 # Sum = 256
.word 33,35,37,39,41,43,45,47,49,51,53,55,57,59,61,63      # Sum = 768
.word 65,67,69,71,73,75,77,79,81,83,85,87,89,91,93,95      # Sum = 1280
.word 97,99,101,103,105,107,109,111,113,115,117,119,121,123,125,127 # Sum = 1792

 msg: .asciiz 	"Result: "

passmsg: .asciiz "The test passed!"
failmsg: .asciiz "The test failed!"
.text
.globl main # Allow calls to main method

  # declare main function as global, allow calls to it

# Old instructions

# Load the address of the list
#	la $t3, list
#	li $t2, 0 # Putting the 1st index into t2
#   add $t2, $t2, $t2 # Multiply the index by itself
#	add $t2, $t2, $t2 # Multiply the index by itself again
#	add $t1, $t2, $t3 # Access the list, t3, with index t2 t3[t2]
#	lw $t4, 0($t1) 	  # Load t4 with the value of t1


    # New Variables
    # t0 = i
    # t1 = sum
    # t2 = constant 10, for comparisons
    # t3 = address of array elements
    # t4 = temporary values


    # New Instructions
    main:
    addi $t0, $0, 0 # clear i
    addi $t1, $0, 0 # clear sum
    ori $t2, $0, 64 # Initialize t2 to 10 (represents length?)
    la $t3, thearray     # Load the address of the array into t3 .. t3 = arr

    # Loop through and collect the sum
    loop:
    slt $t4, $t0, $t2 # if i(t0) === length(t2) then set t4 to 1, else set to 0
    beq $t4, $0, end # if i(t0) is not smaller than 10, exit the loop
    lw $t4, 0($t3) # load current array element into t4
    add $t1, $t1, $t4 # add it to sum
    add $t0, $t0, 1 # increment i
    add $t3, $t3, 4 # increment current array element pointer
    j loop


   	end:

    # C code that is to be translated
    # printf("result: ");
    # printf("%d", sum);
    
    addi $v0, $0, 4 # Print out the result of string
    la $a0, msg
    syscall

    # addi $v0, $0, 1 # followed by actual sum
    # add $a0, $t1, $0
    # syscall
    

   #  jr $ra
   # .end main



compare:


	addi $t3, $zero, 0x1000 # t3 = 0x1000
	la	 $a0, failmsg
	bne	 $t3, $v0, printmsg
	la	 $a0, passmsg

printmsg:
	addi	$v0, $zero, 55
	syscall

halt:	j	halt
