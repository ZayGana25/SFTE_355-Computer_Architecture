.data
prompt:     .asciiz "Enter an integer: "
small_msg:  .asciiz "\nThe smallest value is: "
large_msg:  .asciiz "\nThe largest value is: "
array:      .space 20  # Space for 5 integers (4 bytes each)

.text
.globl main
main:
    # Initialize counter and pointer to the array
    li $t0, 0          # Counter for number of inputs (t0 = 0)
    la $t1, array      # Address of array (t1 points to array)

input_loop:
    # Prompt for input
    li $v0, 4
    la $a0, prompt
    syscall

    # Read integer input from the user
    li $v0, 5
    syscall
    
    sw $v0, 0($t1)
    
    addi $t1, $t1, 4   # Increment the pointer by 4 (next word location)
    addi $t0, $t0, 1   # Increment the counter by 1

    # Loop until 5 integers are entered
    li $t2, 5
    bne $t0, $t2, input_loop

    # Reset pointers and counter for finding smallest and largest
    la $t1, array      # Point back to the start of the array
    lw $t3, 0($t1)     # Initialize smallest (t2) with the first value
    lw $t4, 0($t1)     # Initialize largest (t3) with the first value
    addi $t1, $t1, 4   # Move to the next element in the array
    li $t0, 1          # Set counter to 1 to skip the first value

find_loop:
    lw $t5, 0($t1)     # Load the current array element

    # Check for smallest value
    blt $t5, $t3, update_smallest
    # Check for largest value
    bgt $t5, $t4, update_largest
    
    j next_element     # Move to next element



update_smallest:
    move $t3, $t5      # Update smallest value
    j next_element    # Jump to next element


update_largest:
    move $t4, $t5      # Update largest value

next_element:
    addi $t1, $t1, 4   # Move to the next element (aligned increment)
    addi $t0, $t0, 1   # Increment the counter
    
    li $t2, 5
    blt $t0, $t2, find_loop  # Continue until all elements are processed

    # Print the smallest value
    li $v0, 4
    la $a0, small_msg
    syscall

    li $v0, 1          # Print integer syscall
    move $a0, $t3      # Move smallest value into $a0
    syscall

    # Print the largest value
    li $v0, 4
    la $a0, large_msg
    syscall

    li $v0, 1          # Print integer syscall
    move $a0, $t4      # Move largest value into $a0
    syscall

    # Exit the program
    li $v0, 10
    syscall

