.data
prompt:     .asciiz "Enter a number to be squared: "
result_msg: .asciiz "The square of the number is: "

.text
.globl main

main:
    # Prompt for the input number
    li $v0, 4                   # syscall for print_string
    la $a0, prompt              # load address of prompt
    syscall

    # Read the number
    li $v0, 6                   # syscall for read_float   
    syscall
    mov.s $f0, $f0              # store the number in $f0

    # Calculate the square: square = number * number
    mul.s $f1, $f0, $f0         # $f1 = number * number

    # Print result message
    li $v0, 4                   # syscall for print_string
    la $a0, result_msg          # load address of result message
    syscall

    # Print the result (square)
    li $v0, 2                   # syscall for print_float
    mov.s $f12, $f1             # load result into $f12 for printing
    syscall

    # Exit the program
    li $v0, 10                  # syscall for exit
    syscall
