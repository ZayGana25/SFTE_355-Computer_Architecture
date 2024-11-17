.data
prompt1:    .asciiz "Enter the first number: "
prompt2:    .asciiz "Enter the second number: "
result_msg: .asciiz "The sum is: "

.text
.globl main
main:
    # Prompt for first number
    li $v0, 4             # syscall to print string
    la $a0, prompt1        # load address of prompt1
    syscall

    # Read first number
    li $v0, 5             # syscall to read integer
    syscall
    move $t0, $v0         # move first number to $t0

    # Prompt for second number
    li $v0, 4             # syscall to print string
    la $a0, prompt2        # load address of prompt2
    syscall

    # Read second number
    li $v0, 5             # syscall to read integer
    syscall
    move $t1, $v0         # move second number to $t1

    # Add numbers
    add $t2, $t0, $t1     # add first and second number, store in $t2

    # Print result message
    li $v0, 4             # syscall to print string
    la $a0, result_msg     # load address of result_msg
    syscall

    # Print the result (integer)
    li $v0, 1             # syscall to print integer
    move $a0, $t2         # move the sum to $a0
    syscall

    # Exit
    li $v0, 10            # syscall to exit
    syscall
