.data
prompt:    .asciiz "Enter a number: "
result_msg: .asciiz "The factorial is: "

.text
.globl main
main:
    # Prompt for input
    li $v0, 4
    la $a0, prompt
    syscall

    # Read input
    li $v0, 5
    syscall
    move $t0, $v0   # Store the input number in $t0

    # Initialize factorial result
    li $t1, 1   # Error: Initial factorial result is set to 0 instead of 1

loop:
    mul $t1, $t1, $t0    # Error: $t1 starts as 0, multiplying anything by 0 gives 0
    addi $t0, $t0, -1    # Decrement $t0 by 1
    bgt $t0, 0, loop     # Error: Loop condition allows it to continue until $t0 > 0

    # Print result message
    li $v0, 4
    la $a0, result_msg
    syscall

    # Print result
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall  # Exit